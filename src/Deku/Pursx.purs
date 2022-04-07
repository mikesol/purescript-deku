module Deku.Pursx where

import Prelude
-- import Deku.Debug (type (^^))
-- import Prim.TypeError (class Warn, Text)
import Foreign.Object as Object
import Control.Alt ((<|>))
import Data.Profunctor (lcmap)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Attribute (Attribute, unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Element(..))
import Deku.DOM (class TagToDeku)
import Control.Plus (class Plus, empty)
import FRP.Behavior (sample_)
import FRP.Event (keepLatest, class IsEvent)
import Prim.Boolean (False, True)
import Prim.Row as Row
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Type.Proxy (Proxy(..))

newtype PursxElement event proof payload = PursxElement
  (Element event proof payload)
nut
  :: forall event proof payload
   . Element event proof payload
  -> PursxElement event proof payload
nut = PursxElement

pursx :: forall s. Proxy s
pursx = Proxy
class
  DoVerbForAttr
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (verb :: Symbol)
    (tag :: Symbol)
    (acc :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (newTail :: Symbol)
  | event proof verb acc head tail pursi -> purso newTail
instance
  ( TagToDeku tag deku
  , IsEvent (event proof)
  , Row.Cons acc (event proof (Attribute deku)) pursi purso
  ) =>
  DoVerbForAttr event proof verb tag acc verb tail pursi purso tail
else instance
  ( Sym.Append acc anything acc2
  , Sym.Cons x y tail
  , DoVerbForAttr event proof verb tag acc2 x y pursi purso newTail
  ) =>
  DoVerbForAttr event proof verb tag acc anything tail pursi purso newTail
--
class
  DoVerbForDOM
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (acc :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (newTail :: Symbol)
  | event proof payload verb acc head tail pursi -> purso newTail
instance
  ( Row.Cons acc (PursxElement event proof payload) pursi purso
  ) =>
  DoVerbForDOM event proof payload verb acc verb tail pursi purso tail
else instance
  ( Sym.Append acc anything acc2
  , Sym.Cons x y tail
  , DoVerbForDOM event proof payload verb acc2 x y pursi purso newTail
  ) =>
  DoVerbForDOM event proof payload verb acc anything tail pursi purso newTail
--
class IsWhiteSpace (space :: Symbol)
instance IsWhiteSpace ""
else instance
  ( Sym.Cons x y s
  , IsSingleWhiteSpace x
  , IsWhiteSpace y
  ) =>
  IsWhiteSpace s
class IsSingleWhiteSpace (s :: Symbol)
instance IsSingleWhiteSpace " "
instance IsSingleWhiteSpace "\t"
instance IsSingleWhiteSpace "\n"
class
  PXStart
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (purs :: Row Type)
  | event proof payload verb head tail -> purs
instance
  ( Sym.Cons x y tail
  , PXStart event proof payload verb x y purs
  ) =>
  PXStart event proof payload verb " " tail purs
instance
  ( Sym.Cons x y tail
  , PXStart event proof payload verb x y purs
  ) =>
  PXStart event proof payload verb "\t" tail purs
instance
  ( Sym.Cons x y tail
  , PXStart event proof payload verb x y purs
  ) =>
  PXStart event proof payload verb "\n" tail purs
instance
  ( Sym.Cons x y tail
  , PXTagPreName event proof payload verb x y () purso trailing
  , IsWhiteSpace trailing
  ) =>
  PXStart event proof payload verb "<" tail purso

--
class
  PXTagPreName
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | event proof payload verb head tail pursi -> purso trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreName event proof payload verb x y pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb " " tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreName event proof payload verb x y pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "\t" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreName event proof payload verb x y pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "\n" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "a" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "a" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "b" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "b" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "c" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "c" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "d" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "d" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "e" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "e" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "f" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "f" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "g" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "g" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "h" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "h" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "i" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "i" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "j" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "j" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "k" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "k" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "l" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "l" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "m" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "m" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "n" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "n" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "o" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "o" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "p" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "p" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "q" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "q" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "r" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "r" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "s" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "s" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "t" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "t" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "u" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "u" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "v" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "v" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "w" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "w" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "x" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "x" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "y" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "y" tail pursi purso trailing
instance
  ( PXTagName event proof payload verb "" "z" tail pursi purso trailing
  ) =>
  PXTagPreName event proof payload verb "z" tail pursi purso trailing
--
class
  PXTagName
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | event proof payload verb tag head tail pursi -> purso trailing
instance
  ( Sym.Cons q r tail
  , PXBody event proof payload verb q r pursi purso trailing
  , Sym.Cons x y trailing
  , PreEndTagFromTrailing x y tag newTrailing
  ) =>
  PXTagName event proof payload verb tag ">" tail pursi purso newTrailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "a" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "a" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "b" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "b" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "c" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "c" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "d" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "d" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "e" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "e" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "f" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "f" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "g" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "g" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "h" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "h" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "i" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "i" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "j" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "j" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "k" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "k" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "l" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "l" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "m" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "m" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "n" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "n" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "o" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "o" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "p" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "p" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "q" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "q" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "r" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "r" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "s" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "s" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "t" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "t" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "u" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "u" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "v" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "v" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "w" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "w" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "x" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "x" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "y" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "y" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "z" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "z" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "-" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "-" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "0" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "0" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "1" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "1" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "2" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "2" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "3" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "3" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "4" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "4" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "5" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "5" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "6" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "6" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "7" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "7" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "8" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "8" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "9" tag
  , PXTagName event proof payload verb tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag_ "9" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName event proof payload verb False tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag " " tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName event proof payload verb False tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag "\t" tail pursi purso trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName event proof payload verb False tag x y pursi purso trailing
  ) =>
  PXTagName event proof payload verb tag "\n" tail pursi purso trailing
--
class
  PreEndTagFromTrailing
    (head :: Symbol)
    (tail :: Symbol)
    (tag :: Symbol)
    (newTrailing :: Symbol)
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
instance
  ( EndTagFromTrailing "a" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "a" tail tag trailing
instance
  ( EndTagFromTrailing "b" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "b" tail tag trailing
instance
  ( EndTagFromTrailing "c" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "c" tail tag trailing
instance
  ( EndTagFromTrailing "d" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "d" tail tag trailing
instance
  ( EndTagFromTrailing "e" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "e" tail tag trailing
instance
  ( EndTagFromTrailing "f" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "f" tail tag trailing
instance
  ( EndTagFromTrailing "g" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "g" tail tag trailing
instance
  ( EndTagFromTrailing "h" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "h" tail tag trailing
instance
  ( EndTagFromTrailing "i" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "i" tail tag trailing
instance
  ( EndTagFromTrailing "j" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "j" tail tag trailing
instance
  ( EndTagFromTrailing "k" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "k" tail tag trailing
instance
  ( EndTagFromTrailing "l" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "l" tail tag trailing
instance
  ( EndTagFromTrailing "m" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "m" tail tag trailing
instance
  ( EndTagFromTrailing "n" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "n" tail tag trailing
instance
  ( EndTagFromTrailing "o" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "o" tail tag trailing
instance
  ( EndTagFromTrailing "p" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "p" tail tag trailing
instance
  ( EndTagFromTrailing "q" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "q" tail tag trailing
instance
  ( EndTagFromTrailing "r" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "r" tail tag trailing
instance
  ( EndTagFromTrailing "s" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "s" tail tag trailing
instance
  ( EndTagFromTrailing "t" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "t" tail tag trailing
instance
  ( EndTagFromTrailing "u" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "u" tail tag trailing
instance
  ( EndTagFromTrailing "v" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "v" tail tag trailing
instance
  ( EndTagFromTrailing "w" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "w" tail tag trailing
instance
  ( EndTagFromTrailing "x" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "x" tail tag trailing
instance
  ( EndTagFromTrailing "y" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "y" tail tag trailing
instance
  ( EndTagFromTrailing "z" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "z" tail tag trailing
instance
  ( EndTagFromTrailing "-" tail "" tag trailing
  ) =>
  PreEndTagFromTrailing "-" tail tag trailing
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
instance EndTagFromTrailing ">" tail tag tag tail
--
class
  PXTagPreAttrName
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | event proof payload verb hasAttributed tag head tail pursi -> purso trailing
instance
  ( Sym.Cons ">" trailing tail
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "/"
    tail
    purs
    purs
    trailing
-- trailing will be by definition whatever comes after the closing tag, ie </ foo> will be " foo>"
else instance
  ( Sym.Cons q r tail
  , PXBody event proof payload verb q r pursi purso trailing
  , Sym.Cons x y trailing
  , PreEndTagFromTrailing x y tag newTrailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    ">"
    tail
    pursi
    purso
    newTrailing
--
else instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    " "
    tail
    pursi
    purso
    trailing
else instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "\t"
    tail
    pursi
    purso
    trailing
else instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "\n"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "a" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "a"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "b" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "b"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "c" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "c"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "d" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "d"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "e" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "e"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "f" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "f"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "g" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "g"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "h" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "h"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "i" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "i"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "j" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "j"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "k" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "k"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "l" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "l"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "m" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "m"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "n" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "n"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "o" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "o"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "p" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "p"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "q" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "q"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "r" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "r"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "s" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "s"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "t" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "t"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "u" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "u"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "v" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "v"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "w" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "w"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "x" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "x"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "y" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "y"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "z" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "z"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "A" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "A"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "B" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "B"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "C" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "C"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "D" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "D"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "E" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "E"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "F" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "F"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "G" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "G"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "H" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "H"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "I" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "I"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "J" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "J"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "K" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "K"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "L" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "L"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "M" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "M"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "N" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "N"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "O" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "O"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "P" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "P"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "Q" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "Q"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "R" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "R"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "S" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "S"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "T" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "T"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "U" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "U"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "V" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "V"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "W" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "W"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "X" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "X"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "Y" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "Y"
    tail
    pursi
    purso
    trailing
else instance
  ( PXTagAttrName event proof payload verb hasAttributed tag "Z" tail pursi
      purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "Z"
    tail
    pursi
    purso
    trailing
else instance
  ( Sym.Cons x y tail
  , DoVerbForAttr event proof verb tag "" x y pursi pursx newTail
  , Sym.Cons xx yy newTail
  , PXTagPreAttrName event proof payload verb True tag xx yy pursx purso
      trailing
  ) =>
  PXTagPreAttrName event
    proof
    payload
    verb
    False
    tag
    verb
    tail
    pursi
    purso
    trailing
--
class
  PXTagAttrName
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | event proof payload verb hasAttributed tag head tail pursi -> purso trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "a"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "b"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "c"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "d"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "e"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "f"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "g"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "h"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "i"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "j"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "k"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "l"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "m"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "n"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "o"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "p"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "q"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "r"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "s"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "t"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "u"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "v"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "w"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "x"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "y"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "z"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "-"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "0"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "1"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "2"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "3"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "4"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "5"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "6"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "7"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "8"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "9"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "="
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    " "
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "\t"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "\n"
    tail
    pursi
    purso
    trailing
--
class
  PXTagPostAttrName
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | event proof payload verb hasAttributed tag head tail pursi -> purso trailing
instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPostAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    " "
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPostAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "\t"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPostAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "\n"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPostAttrName event
    proof
    payload
    verb
    hasAttributed
    tag
    "="
    tail
    pursi
    purso
    trailing
--
class
  PXTagPreAttrValue
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | event proof payload verb hasAttributed tag head tail pursi -> purso trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    " "
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "\t"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "\n"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "\""
    tail
    pursi
    purso
    trailing
--
class
  PXTagAttrValue
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | event proof payload verb hasAttributed tag head tail pursi -> purso trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "a"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "b"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "c"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "d"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "e"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "f"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "g"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "h"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "i"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "j"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "k"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "l"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "m"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "n"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "o"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "p"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "q"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "r"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "s"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "t"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "u"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "v"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "w"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "x"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "y"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "z"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "A"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "B"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "C"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "D"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "E"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "F"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "G"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "H"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "I"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "J"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "K"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "L"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "M"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "N"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "O"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "P"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "Q"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "R"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "S"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "T"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "U"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "V"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "W"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "X"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "Y"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "Z"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "0"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "1"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "2"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "3"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "4"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "5"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "6"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "7"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "8"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "9"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    ":"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    ","
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    ";"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "'"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "!"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "@"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "#"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "$"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "%"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "^"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "&"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "*"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "("
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    ")"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "_"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "-"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "="
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "`"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "~"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "<"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    ">"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "/"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "."
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "\\"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    " "
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "\t"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagAttrValue event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "\n"
    tail
    pursi
    purso
    trailing
instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName event proof payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue event
    proof
    payload
    verb
    hasAttributed
    tag
    "\""
    tail
    pursi
    purso
    trailing
class
  PXBody
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | event proof payload verb tail pursi -> purso trailing

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
    (event :: Type -> Type -> Type)
    (proof :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | event proof payload verb head tail pursi -> purso trailing
instance CloseOrRepeat event proof payload verb "/" tail purs purs tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody event proof payload verb mm bb pursi purso newTrailing
  ) =>
  CloseOrRepeat event proof payload verb "!" tail pursi purso newTrailing
else instance
  ( PXTagPreName event proof payload verb anything tail () pursm trailing
  , Row.Union pursi pursm pursz
  , Sym.Cons x y trailing
  , PXBody event proof payload verb x y pursz purso newTrailing
  ) =>
  CloseOrRepeat event proof payload verb anything tail pursi purso newTrailing
instance
  ( Sym.Cons x y tail
  , CloseOrRepeat event proof payload verb x y pursi purso trailing
  ) =>
  PXBody event proof payload verb "<" tail pursi purso trailing
else instance
  ( Sym.Cons x y tail
  , DoVerbForDOM event proof payload verb "" x y pursi pursx newTail
  , Sym.Cons xx yy newTail
  , PXBody event proof payload verb xx yy pursx purso trailing
  ) =>
  PXBody event proof payload verb verb tail pursi purso trailing
else instance
  ( Sym.Cons x y tail
  , PXBody event proof payload verb x y pursi purso trailing
  ) =>
  PXBody event proof payload verb anything tail pursi purso trailing

class
  Plus (event proof) <=
  PursxToElement event proof payload (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> event proof payload r where
  pursxToElement
    :: forall proxy
     . proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean
       , element :: Element event proof payload
       }

instance pursxToElementConsElt ::
  ( Row.Cons key (PursxElement event proof payload) r' r
  , PursxToElement event proof payload rest r
  , IsSymbol key
  ) =>
  PursxToElement event
    proof
    payload
    (RL.Cons key (PursxElement event proof payload) rest)
    r where
  pursxToElement _ r =
    let
      { cache, element } = pursxToElement (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectSymbol pxk) false cache
      , element: Element \parent di ->
          (let Element y = pxe in y) (reflectSymbol pxk) di
            <|> (let Element y = element in y) parent di
      }
    where
    pxk = Proxy :: _ key
    PursxElement pxe = get pxk r

else instance pursxToElementConsAttr ::
  ( Row.Cons key (event proof (Attribute deku)) r' r
  , PursxToElement event proof payload rest r
  , IsSymbol key
  ) =>
  PursxToElement event
    proof
    payload
    (RL.Cons key (event proof (Attribute deku)) rest)
    r where
  pursxToElement _ r =
    let
      { cache, element } = pursxToElement (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectSymbol pxk) true cache
      , element: Element \parent di@(DOMInterpret { setAttribute }) ->
          map
            ( lcmap unsafeUnAttribute
                ( \{ key, value } -> setAttribute
                    { id: reflectSymbol $ pxk
                    , key
                    , value
                    }
                )
            )
            (get pxk r)
            <|> (let Element y = element in y) parent di
      }
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  Plus (event proof) =>
  PursxToElement event proof payload RL.Nil r where
  pursxToElement _ _ = { cache: Object.empty, element: Element \_ _ -> empty }

psx
  :: forall event proof payload proxy (html :: Symbol)
   . IsSymbol html
  => PXStart event proof payload "~" " " html ()
  => PursxToElement event proof payload RL.Nil ()
  => IsEvent (event proof)
  => proxy html
  -> Element event proof payload
psx px = makePursx px {}

makePursx
  :: forall event proof payload proxy (html :: Symbol) r rl
   . IsSymbol html
  => PXStart event proof payload "~" " " html r
  => RL.RowToList r rl
  => PursxToElement event proof payload rl r
  => IsEvent (event proof)
  => proxy html
  -> { | r }
  -> Element event proof payload
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall event proof payload verb proxyA proxyB (html :: Symbol) r rl
   . IsSymbol html
  => IsSymbol verb
  => PXStart event proof payload verb " " html r
  => RL.RowToList r rl
  => PursxToElement event proof payload rl r
  => IsEvent (event proof)
  => proxyA verb
  -> proxyB html
  -> { | r }
  -> Element event proof payload
makePursx' verb html r = Element go
  where
  go parent di@(DOMInterpret { makePursx: mpx, ids }) = keepLatest
    ( (sample_ ids (pure unit)) <#> \me ->
        let
          { cache, element } = pursxToElement (Proxy :: _ rl) r
        in
          ( pure $ mpx
              { id: me
              , parent
              , cache
              , html: reflectSymbol html
              , verb: reflectSymbol verb
              }
          ) <|> (let Element y = element in y) me di
    )

infixr 5 makePursx as ~~

