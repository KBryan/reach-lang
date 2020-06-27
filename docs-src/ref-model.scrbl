#lang scribble/manual
@(require "lib.rkt")

@title[#:version "" #:tag "ref-model"]{Language Model}

This document describes the fundamental assumptions and concepts of Reach. First, we discuss the model of running a Reach program in @secref["ref-model-eval"]. Next, we discuss the details about compilation of a Reach program that are relevant to Reach programmers in @secref["ref-model-compile"]. Finally, we discuss how Reach programs are syntactically constructed in @secref["ref-model-syntax"].

@section[#:tag "ref-model-eval"]{Evaluation Model}

Reach programs specify a decentralized application (@deftech{DApp}), which is a distributed computation involving many @tech{participants} and utilizing one @tech{consensus network} for reaching agreement on the intermediate @tech{values} of the computation. @margin-note{"Many" is a technical term that means "zero or more".} When the computation terminates, all @tech{participants} agree on the resulting @tech{value}, because they agreed on the intermediate @tech{values}.

A @deftech{consensus network} is a network protocol with a @tech{network token}, a set of @tech{accounts}, a set of @tech{contracts}, and a @tech{time}. A @deftech{network token} is an opaque unit of account. A @tech{consensus network}'s @deftech{time} is some monotonically increasing value from a total ordered set. @tech{Consensus networks} support @deftech{transfers} of @tech{network tokens} between @tech{accounts}. An @deftech{account} is a unique identity (called an @deftech{address}) with a non-negative balance of @tech{network tokens}. @tech{Accounts} may sign @tech{values} in a way that may not be repudiated or impersonated; this is called @deftech{publication}. @deftech{Contracts} are @tech{accounts} with three extra capacities: they persistently store @tech{values} (called the @deftech{consensus state}), they may receive @tech{publications}, and when they receive @tech{publications}, they systematically process them and may modify their @tech{consensus state}, make @tech{publications}, and may @tech{transfer} @tech{network tokens} in response to the reception. The chapter, @secref["ref-networks"], discusses which @tech{consensus networks} are supported by Reach.

A @deftech{participant} is a logical actor which takes part in a @|DApp|. It is associated with an @tech{account} on the @tech{consensus network}. @margin-note{The same @tech{account} may be used by multiple @tech{participants} in a @|DApp|.} It has persistently stored @tech{values}, called its @deftech{local state}. It has a @tech{frontend} which it @tech{interacts} with. A @deftech{frontend} is an abstract actor which supports a set of functions which consume and produce @tech{values}; when a @tech{participant} invokes one of these functions it is referred to as @deftech{interact}action.

A @|DApp| computation can be seen as a graph of @tech{steps} with a unique first @tech{step}. A @deftech{step} is a set of @tech{local computations} by @tech{participants} followed by a single @tech{consensus computation} introduced via a single @tech{consensus transfer}.

A @deftech{local computation} is executed by a single @tech{participant} and is a sequence of @tech{local statements}. A @deftech{local statement} either binds a piece of @tech{local state} via a @tech{local expression}, @tech{asserts} a property of the @tech{local state}, or @tech{interacts} with the @tech{frontend}. A @deftech{consensus transfer} is executed by a single @tech{participant} (called the @deftech{originator}) which makes a @tech{publication} of a set of @tech{values} from its @tech{local state} and @tech{transfers} some @tech{network tokens} to the @tech{contract} @tech{account}. A @tech{consensus transfer} specifies an alternative @tech{consensus transfer} that is executed if the @tech{originator} fails to make the transfer before a given @tech{time}.

A @deftech{consensus computation} is a graph of @tech{consensus statements} with a unique first statement. A @deftech{consensus statement} is either computation that binds @tech{consensus state} a via @tech{consensus expression}, @tech{asserts} a property of the @tech{consensus state}, performs a @tech{transfer}, evaluates a @tech{consensus expression} to determine the tail of the @tech{consensus computation}, or @deftech{commits} to the next @tech{step}.

An @deftech{expression} is the application of a @tech{primitive} function that consumes some @tech{values} and produces some @tech{values}. An @tech{expression} is called a @deftech{local expression} if it uses @tech{local primitive} or @tech{consensus primitives}, whereas it is called a @deftech{consensus expression} if does not use any @tech{local primitives}. A @deftech{primitive} is a function from a set of @deftech{local primitives} and @deftech{consensus primitives}.

An @deftech{assert}ion is either: a @deftech{static assertion}, which is an @tech{expression} that logically evaluates to the boolean @racket[true]; an @deftech{assumption}, which is an @tech{local expression} that should evaluate to the boolean @racket[true] if @tech{frontends} provide satisfactory @tech{values}; a @deftech{requirement}, which is a @tech{consensus expression} that should evaluate to the boolean @racket[true] if @tech{participants} behave @tech{honest}ly; or, a @deftech{possibility}, which is an @tech{expression} for which there exists some values that @tech{honest} @tech{participants} and satisfying @tech{frontends} could submit which results in the evaluation of the expression to the boolean @racket[true]. An @deftech{honest} @tech{participant} is one that executes the @tech{steps} specified by the @|DApp|.

A @deftech{value} is either a @tech{base value} or a statically-sized array of @tech{base values}. A @deftech{base value} is either an unsigned integer of 256 bits, a boolean, a string of bytes, or an @tech{account} @tech{address}.

@section[#:tag "ref-model-compile"]{Compilation Model}

XXX

@section[#:tag "ref-model-syntax"]{Syntax Model}

XXX
