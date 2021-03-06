'reach 0.1';

const ParamsType = Object({
  collateral: UInt,
  pre: UInt,
  post: UInt,
  maturation: UInt,
  maxLenderDelay: UInt,
});

const hasSendOutcome = {
  sendOutcome: Fun([Bytes], Null),
};

export const main = Reach.App(
  {},
  [
    ['Borrower', {
      ...hasSendOutcome,
      getParams: Fun([], ParamsType),
      waitForPayback: Fun([], Null),
    }],
    ['Lender', {
      ...hasSendOutcome,
      acceptParams: Fun([ParamsType], Null),
    }],
  ],
  (Borrower, Lender) => {
    const sendOutcome = (which) => {
      return (() => {
        each([Borrower, Lender], () => {
          interact.sendOutcome(which);
        });
      });
    };

    Borrower.only(() => {
      const params = declassify(interact.getParams());
      assume(params.pre < params.post); });
    Borrower.publish(params)
      .pay(params.collateral);
    const { collateral, pre, post, maturation, maxLenderDelay }
          = params;
    require(pre < post);
    commit();

    Lender.only(() => {
      interact.acceptParams(params);
    });
    Lender.pay(pre)
      .timeout(maxLenderDelay, () =>
        closeTo(Borrower, sendOutcome(
          'Lender failed to lend on time'
        )));
    transfer(pre).to(Borrower);
    commit();

    Borrower.only(() => {
      interact.waitForPayback();
    });
    Borrower.pay(post)
      .timeout(maturation, () =>
        closeTo(Lender, sendOutcome(
          'Borrower failed to pay on time'
        )));
    transfer(post).to(Lender);
    transfer(collateral).to(Borrower);
    commit();
  }
);
