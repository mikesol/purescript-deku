module Deku.PursxParser where

import Deku.Attribute (Attribute)
import Deku.Core (Nut)
import Deku.DOM (class TagToDeku)
import FRP.Poll (Poll)
import Prim.Boolean (False, True)
import Prim.Row as Row
import Prim.RowList as RL
import Prim.Symbol as Sym

class
  DoVerbForAttr
    (verb :: Symbol)
    (tag :: Symbol)
    (acc :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (newTail :: Symbol)
  | verb acc head tail onezero pursi pathi -> purso patho newTail

instance
  ( TagToDeku tag deku
  , Row.Cons acc (Poll (Attribute deku)) pursi purso
  , Row.Cons acc onezero pathi patho
  ) =>
  DoVerbForAttr verb tag acc verb tail onezero pursi pathi purso patho tail
else instance
  ( Sym.Append acc anything acc2
  , Sym.Cons x y tail
  , DoVerbForAttr verb tag acc2 x y onezero pursi pathi purso patho newTail
  ) =>
  DoVerbForAttr verb tag acc anything tail onezero pursi pathi purso patho newTail

--
class
  DoVerbForDOM
    (verb :: Symbol)
    (acc :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (newTail :: Symbol)
  | verb acc head tail onezero pursi pathi -> purso patho newTail

instance
  ( Row.Cons acc Nut pursi purso
  , Row.Cons acc onezero pathi patho
  ) =>
  DoVerbForDOM verb acc verb tail onezero pursi pathi purso patho tail
else instance
  ( Row.Cons acc String pursi purso
  , Row.Cons acc onezero pathi patho
  ) =>
  DoVerbForDOM verb acc verb tail onezero pursi pathi purso patho tail
else instance
  ( Sym.Append acc anything acc2
  , Sym.Cons x y tail
  , DoVerbForDOM verb acc2 x y onezero pursi pathi purso patho newTail
  ) =>
  DoVerbForDOM verb acc anything tail onezero pursi pathi purso patho newTail

--
class IsWhiteSpace (space :: Symbol)

instance IsWhiteSpace ""
else instance (Sym.Cons x y s, IsSingleWhiteSpace x, IsWhiteSpace y) => IsWhiteSpace s

class IsSingleWhiteSpace (s :: Symbol)

instance IsSingleWhiteSpace " "
instance IsSingleWhiteSpace "\t"
instance IsSingleWhiteSpace "\n"

class
  PXStart
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (purs :: Row Type)
    (path :: Row (RL.RowList Symbol))
  | verb head tail -> purs path

instance (Sym.Cons x y tail, PXStart verb x y purs path) => PXStart verb " " tail purs path
instance (Sym.Cons x y tail, PXStart verb x y purs path) => PXStart verb "\t" tail purs path
instance (Sym.Cons x y tail, PXStart verb x y purs path) => PXStart verb "\n" tail purs path
instance
  ( Sym.Cons x y tail
  , PXTagPreName verb x y RL.Nil () () purso patho trailing
  , IsWhiteSpace trailing
  ) =>
  PXStart verb "<" tail purso patho

--
class
  PXTagPreName
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (trailing :: Symbol)
  | verb head tail onezero pursi pathi -> purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreName verb x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPreName verb " " tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreName verb x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPreName verb "\t" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreName verb x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPreName verb "\n" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "a" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "a" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "b" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "b" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "c" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "c" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "d" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "d" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "e" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "e" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "f" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "f" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "g" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "g" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "h" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "h" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "i" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "i" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "j" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "j" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "k" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "k" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "l" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "l" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "m" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "m" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "n" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "n" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "o" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "o" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "p" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "p" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "q" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "q" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "r" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "r" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "s" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "s" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "t" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "t" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "u" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "u" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "v" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "v" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "w" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "w" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "x" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "x" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "y" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "y" tail onezero pursi pathi purso patho trailing

instance
  PXTagName verb "" "z" tail onezero pursi pathi purso patho trailing =>
  PXTagPreName verb "z" tail onezero pursi pathi purso patho trailing

--
class
  PXTagName
    (verb :: Symbol)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (trailing :: Symbol)
  | verb tag head tail onezero pursi pathi -> purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "a" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "a" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "b" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "b" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "c" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "c" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "d" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "d" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "e" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "e" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "f" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "f" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "g" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "g" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "h" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "h" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "i" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "i" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "j" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "j" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "k" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "k" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "l" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "l" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "m" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "m" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "n" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "n" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "o" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "o" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "p" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "p" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "q" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "q" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "r" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "r" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "s" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "s" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "t" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "t" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "u" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "u" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "v" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "v" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "w" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "w" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "x" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "x" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "y" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "y" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "z" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "z" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "-" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "-" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "0" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "0" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "1" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "1" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "2" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "2" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "3" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "3" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "4" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "4" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "5" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "5" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "6" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "6" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "7" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "7" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "8" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "8" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "9" tag
  , PXTagName verb tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag_ "9" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb False tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag " " tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb False tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag "\t" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb False tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagName verb tag "\n" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons q r tail
  , PXBody verb q r onezero pursi pathi purso patho trailing
  , Sym.Cons x y trailing
  , PreEndTagFromTrailing x y tag newTrailing
  ) =>
  PXTagName verb tag ">" tail onezero pursi pathi purso patho newTrailing

--
class
  PreEndTagFromTrailing (head :: Symbol) (tail :: Symbol) (tag :: Symbol) (newTrailing :: Symbol)
  | head tail -> tag newTrailing

instance
  ( Sym.Cons x y tail
  , PreEndTagFromTrailing x y tag trailing
  ) =>
  PreEndTagFromTrailing " " tail tag trailing

instance
  ( Sym.Cons x y tail
  , PreEndTagFromTrailing x y tag trailing
  ) =>
  PreEndTagFromTrailing "\t" tail tag trailing

instance
  ( Sym.Cons x y tail
  , PreEndTagFromTrailing x y tag trailing
  ) =>
  PreEndTagFromTrailing "\n" tail tag trailing

instance EndTagFromTrailing "a" tail "" tag trailing => PreEndTagFromTrailing "a" tail tag trailing
instance EndTagFromTrailing "b" tail "" tag trailing => PreEndTagFromTrailing "b" tail tag trailing
instance EndTagFromTrailing "c" tail "" tag trailing => PreEndTagFromTrailing "c" tail tag trailing
instance EndTagFromTrailing "d" tail "" tag trailing => PreEndTagFromTrailing "d" tail tag trailing
instance EndTagFromTrailing "e" tail "" tag trailing => PreEndTagFromTrailing "e" tail tag trailing
instance EndTagFromTrailing "f" tail "" tag trailing => PreEndTagFromTrailing "f" tail tag trailing
instance EndTagFromTrailing "g" tail "" tag trailing => PreEndTagFromTrailing "g" tail tag trailing
instance EndTagFromTrailing "h" tail "" tag trailing => PreEndTagFromTrailing "h" tail tag trailing
instance EndTagFromTrailing "i" tail "" tag trailing => PreEndTagFromTrailing "i" tail tag trailing
instance EndTagFromTrailing "j" tail "" tag trailing => PreEndTagFromTrailing "j" tail tag trailing
instance EndTagFromTrailing "k" tail "" tag trailing => PreEndTagFromTrailing "k" tail tag trailing
instance EndTagFromTrailing "l" tail "" tag trailing => PreEndTagFromTrailing "l" tail tag trailing
instance EndTagFromTrailing "m" tail "" tag trailing => PreEndTagFromTrailing "m" tail tag trailing
instance EndTagFromTrailing "n" tail "" tag trailing => PreEndTagFromTrailing "n" tail tag trailing
instance EndTagFromTrailing "o" tail "" tag trailing => PreEndTagFromTrailing "o" tail tag trailing
instance EndTagFromTrailing "p" tail "" tag trailing => PreEndTagFromTrailing "p" tail tag trailing
instance EndTagFromTrailing "q" tail "" tag trailing => PreEndTagFromTrailing "q" tail tag trailing
instance EndTagFromTrailing "r" tail "" tag trailing => PreEndTagFromTrailing "r" tail tag trailing
instance EndTagFromTrailing "s" tail "" tag trailing => PreEndTagFromTrailing "s" tail tag trailing
instance EndTagFromTrailing "t" tail "" tag trailing => PreEndTagFromTrailing "t" tail tag trailing
instance EndTagFromTrailing "u" tail "" tag trailing => PreEndTagFromTrailing "u" tail tag trailing
instance EndTagFromTrailing "v" tail "" tag trailing => PreEndTagFromTrailing "v" tail tag trailing
instance EndTagFromTrailing "w" tail "" tag trailing => PreEndTagFromTrailing "w" tail tag trailing
instance EndTagFromTrailing "x" tail "" tag trailing => PreEndTagFromTrailing "x" tail tag trailing
instance EndTagFromTrailing "y" tail "" tag trailing => PreEndTagFromTrailing "y" tail tag trailing
instance EndTagFromTrailing "z" tail "" tag trailing => PreEndTagFromTrailing "z" tail tag trailing
instance EndTagFromTrailing "-" tail "" tag trailing => PreEndTagFromTrailing "-" tail tag trailing

--
class
  EndTagFromTrailing
    (head :: Symbol)
    (tail :: Symbol)
    (tagAcc :: Symbol)
    (tag :: Symbol)
    (newTrailing :: Symbol)
  | head tail tagAcc -> tag newTrailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "a" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "a" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "b" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "b" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "c" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "c" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "d" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "d" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "e" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "e" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "f" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "f" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "g" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "g" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "h" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "h" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "i" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "i" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "j" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "j" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "k" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "k" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "l" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "l" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "m" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "m" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "n" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "n" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "o" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "o" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "p" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "p" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "q" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "q" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "r" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "r" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "s" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "s" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "t" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "t" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "u" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "u" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "v" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "v" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "w" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "w" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "x" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "x" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "y" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "y" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "z" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "z" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "-" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "-" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "0" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "0" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "1" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "1" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "2" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "2" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "3" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "3" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "4" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "4" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "5" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "5" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "6" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "6" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "7" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "7" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "8" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "8" tail tag_ otag trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "9" tag
  , EndTagFromTrailing x y tag otag trailing
  ) =>
  EndTagFromTrailing "9" tail tag_ otag trailing

--
instance EndTagFromTrailing ">" tail tag tag tail

--
class
  PXTagPreAttrName
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (trailing :: Symbol)
  | verb hasAttributed tag head tail onezero pursi pathi -> purso patho trailing

instance
  Sym.Cons ">" trailing tail =>
  PXTagPreAttrName verb hasAttributed tag "/" tail onezero purs path purs path trailing
else instance
  ( Sym.Cons q r tail
  , PXBody verb q r onezero pursi pathi purso patho trailing
  , Sym.Cons x y trailing
  , PreEndTagFromTrailing x y tag newTrailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag ">" tail onezero pursi pathi purso patho newTrailing
else instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag " " tail onezero pursi pathi purso patho trailing
else instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "\t" tail onezero pursi pathi purso patho trailing
else instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "\n" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "a" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "a" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "b" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "b" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "c" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "c" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "d" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "d" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "e" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "e" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "f" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "f" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "g" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "g" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "h" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "h" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "i" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "i" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "j" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "j" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "k" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "k" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "l" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "l" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "m" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "m" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "n" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "n" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "o" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "o" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "p" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "p" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "q" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "q" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "r" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "r" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "s" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "s" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "t" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "t" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "u" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "u" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "v" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "v" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "w" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "w" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "x" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "x" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "y" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "y" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "z" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "z" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "A" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "A" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "B" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "B" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "C" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "C" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "D" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "D" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "E" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "E" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "F" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "F" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "G" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "G" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "H" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "H" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "I" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "I" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "J" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "J" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "K" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "K" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "L" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "L" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "M" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "M" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "N" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "N" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "O" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "O" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "P" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "P" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "Q" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "Q" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "R" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "R" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "S" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "S" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "T" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "T" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "U" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "U" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "V" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "V" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "W" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "W" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "X" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "X" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "Y" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "Y" tail onezero pursi pathi purso patho trailing
else instance
  PXTagAttrName verb hasAttributed tag "Z" tail onezero pursi pathi purso patho trailing =>
  PXTagPreAttrName verb hasAttributed tag "Z" tail onezero pursi pathi purso patho trailing
else instance
  ( Sym.Cons x y tail
  , DoVerbForAttr verb tag "" x y onezero pursi pathi pursx pathx newTail
  , Sym.Cons xx yy newTail
  , PXTagPreAttrName verb True tag xx yy onezero pursx pathx purso patho trailing
  ) =>
  PXTagPreAttrName verb False tag verb tail onezero pursi pathi purso patho trailing

--
class
  PXTagAttrName
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (trailing :: Symbol)
  | verb hasAttributed tag head tail onezero pursi pathi -> purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "a" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "b" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "c" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "d" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "e" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "f" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "g" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "h" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "i" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "j" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "k" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "l" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "m" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "n" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "o" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "p" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "q" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "r" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "s" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "t" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "u" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "v" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "w" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "x" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "y" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "z" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "A" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "B" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "C" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "D" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "E" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "F" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "G" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "H" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "I" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "J" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "K" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "L" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "M" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "N" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "O" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "P" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "Q" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "R" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "S" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "T" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "U" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "V" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "W" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "X" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "Y" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "Z" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "-" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "0" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "1" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "2" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "3" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "4" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "5" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "6" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "7" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "8" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "9" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag " " tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "\t" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "\n" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "=" tail onezero pursi pathi purso patho trailing

--
class
  PXTagPostAttrName
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (trailing :: Symbol)
  | verb hasAttributed tag head tail onezero pursi pathi -> purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPostAttrName verb hasAttributed tag " " tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPostAttrName verb hasAttributed tag "\t" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPostAttrName verb hasAttributed tag "\n" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPostAttrName verb hasAttributed tag "=" tail onezero pursi pathi purso patho trailing

--
class
  PXTagPreAttrValue
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (trailing :: Symbol)
  | verb hasAttributed tag head tail onezero pursi pathi -> purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPreAttrValue verb hasAttributed tag " " tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPreAttrValue verb hasAttributed tag "\t" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPreAttrValue verb hasAttributed tag "\n" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagPreAttrValue verb hasAttributed tag "\"" tail onezero pursi pathi purso patho trailing

--
class
  PXTagAttrValue
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (trailing :: Symbol)
  | verb hasAttributed tag head tail onezero pursi pathi -> purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "a" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "b" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "c" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "d" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "e" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "f" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "g" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "h" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "i" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "j" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "k" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "l" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "m" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "n" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "o" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "p" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "q" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "r" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "s" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "t" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "u" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "v" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "w" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "x" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "y" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "z" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "A" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "B" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "C" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "D" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "E" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "F" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "G" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "H" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "I" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "J" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "K" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "L" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "M" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "N" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "O" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "P" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "Q" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "R" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "S" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "T" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "U" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "V" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "W" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "X" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "Y" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "Z" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "0" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "1" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "2" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "3" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "4" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "5" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "6" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "7" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "8" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "9" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag ":" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "," tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag ";" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "'" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "!" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "?" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "@" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "#" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "$" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "%" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "^" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "&" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "*" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "(" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag ")" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "_" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "-" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "=" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "`" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "~" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "<" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag ">" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "/" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "." tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "\\" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag " " tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "\t" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "\n" tail onezero pursi pathi purso patho trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb hasAttributed tag x y onezero pursi pathi purso patho trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "\"" tail onezero pursi pathi purso patho trailing

class
  PXBody
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (trailing :: Symbol)
  | verb tail onezero pursi pathi -> purso patho trailing

class
  CommendEndCandidate2 (head :: Symbol) (tail :: Symbol) (trailing :: Symbol)
  | head tail -> trailing

instance CommendEndCandidate2 ">" tail tail
else instance
  ( Sym.Cons x y tail
  , SkipUntilCommentEnd x y trailing
  ) =>
  CommendEndCandidate2 anything tail trailing

class
  CommendEndCandidate1 (head :: Symbol) (tail :: Symbol) (trailing :: Symbol)
  | head tail -> trailing

instance
  ( Sym.Cons x y tail
  , CommendEndCandidate2 x y trailing
  ) =>
  CommendEndCandidate1 "-" tail trailing
else instance
  ( Sym.Cons x y tail
  , SkipUntilCommentEnd x y trailing
  ) =>
  CommendEndCandidate1 anything tail trailing

class
  SkipUntilCommentEnd (head :: Symbol) (tail :: Symbol) (trailing :: Symbol)
  | head tail -> trailing

instance
  ( Sym.Cons x y tail
  , CommendEndCandidate1 x y trailing
  ) =>
  SkipUntilCommentEnd "-" tail trailing
else instance
  ( Sym.Cons x y tail
  , SkipUntilCommentEnd x y trailing
  ) =>
  SkipUntilCommentEnd anything tail trailing

class
  CloseOrRepeat
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (onezero :: RL.RowList Symbol)
    (pursi :: Row Type)
    (pathi :: Row (RL.RowList Symbol))
    (purso :: Row Type)
    (patho :: Row (RL.RowList Symbol))
    (trailing :: Symbol)
  | verb head tail onezero pursi pathi -> purso patho trailing

instance CloseOrRepeat verb "/" tail onezero purs path purs path tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody verb mm bb onezero pursi pathi purso patho newTrailing
  ) =>
  CloseOrRepeat verb "!" tail onezero pursi pathi purso patho newTrailing
else instance
  ( PXTagPreName verb anything tail (RL.Cons "0" "0" onezero) () () pursm pathm trailing
  , Row.Union pursi pursm pursz
  , Row.Union pathi pathm pathz
  , Sym.Cons x y trailing
  , PXBody verb x y (RL.Cons "1" "1" onezero) pursz pathz purso patho newTrailing
  ) =>
  CloseOrRepeat verb anything tail onezero pursi pathi purso patho newTrailing

instance
  ( Sym.Cons x y tail
  , CloseOrRepeat verb x y onezero pursi pathi purso patho trailing
  ) =>
  PXBody verb "<" tail onezero pursi pathi purso patho trailing
else instance
  ( Sym.Cons x y tail
  , DoVerbForDOM verb "" x y onezero pursi pathi pursx pathx newTail
  , Sym.Cons xx yy newTail
  , PXBody verb xx yy onezero pursx pathx purso patho trailing
  ) =>
  PXBody verb verb tail onezero pursi pathi purso patho trailing
else instance
  ( Sym.Cons x y tail
  , PXBody verb x y onezero pursi pathi purso patho trailing
  ) =>
  PXBody verb anything tail onezero pursi pathi purso patho trailing
