module Deku.Pursx where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), PSR)
import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Maybe (Maybe(..))
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import Data.Reflectable (class Reflectable, reflectType)
import Data.Symbol (class IsSymbol)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Domable, M, Node(..))
import Deku.DOM (class TagToDeku)
import FRP.Event (AnEvent, bang, subscribe, makeEvent)
import Foreign.Object as Object
import Prim.Boolean (False, True)
import Prim.Row as Row
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Type.Proxy (Proxy(..))

newtype PursxElement lock payload = PursxElement
  (Domable lock payload)

nut
  :: forall lock payload
   . Domable lock payload
  -> PursxElement lock payload
nut = PursxElement

pursx :: forall s. Proxy s
pursx = Proxy

class
  DoVerbForAttr
    (verb :: Symbol)
    (tag :: Symbol)
    (acc :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (newTail :: Symbol)
  | verb acc head tail pursi -> purso newTail

instance
  ( TagToDeku tag deku
  , Row.Cons acc (AnEvent M (Attribute deku)) pursi purso
  ) =>
  DoVerbForAttr verb tag acc verb tail pursi purso tail
else instance
  ( Sym.Append acc anything acc2
  , Sym.Cons x y tail
  , DoVerbForAttr verb tag acc2 x y pursi purso newTail
  ) =>
  DoVerbForAttr verb tag acc anything tail pursi purso newTail

--
class
  DoVerbForDOM
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (acc :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (newTail :: Symbol)
  | m lock payload verb acc head tail pursi -> purso newTail

instance
  ( Row.Cons acc (PursxElement lock payload) pursi purso
  ) =>
  DoVerbForDOM m lock payload verb acc verb tail pursi purso tail
else instance
  ( Sym.Append acc anything acc2
  , Sym.Cons x y tail
  , DoVerbForDOM m lock payload verb acc2 x y pursi purso newTail
  ) =>
  DoVerbForDOM m lock payload verb acc anything tail pursi purso newTail

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
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (purs :: Row Type)
  | m lock payload verb head tail -> purs

instance
  ( Sym.Cons x y tail
  , PXStart m lock payload verb x y purs
  ) =>
  PXStart m lock payload verb " " tail purs

instance
  ( Sym.Cons x y tail
  , PXStart m lock payload verb x y purs
  ) =>
  PXStart m lock payload verb "\t" tail purs

instance
  ( Sym.Cons x y tail
  , PXStart m lock payload verb x y purs
  ) =>
  PXStart m lock payload verb "\n" tail purs

instance
  ( Sym.Cons x y tail
  , PXTagPreName m lock payload verb x y () purso trailing
  , IsWhiteSpace trailing
  ) =>
  PXStart m lock payload verb "<" tail purso

--
class
  PXTagPreName
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | m lock payload verb head tail pursi -> purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreName m lock payload verb x y pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb " " tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreName m lock payload verb x y pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "\t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreName m lock payload verb x y pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "\n" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "a" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "a" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "b" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "b" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "c" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "c" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "d" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "d" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "e" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "e" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "f" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "f" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "g" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "g" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "h" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "h" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "i" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "i" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "j" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "j" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "k" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "k" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "l" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "l" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "m" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "m" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "n" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "n" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "o" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "o" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "p" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "p" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "q" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "q" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "r" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "r" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "s" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "s" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "t" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "t" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "u" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "u" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "v" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "v" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "w" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "w" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "x" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "x" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "y" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "y" tail pursi purso trailing

instance
  ( PXTagName m lock payload verb "" "z" tail pursi purso trailing
  ) =>
  PXTagPreName m lock payload verb "z" tail pursi purso trailing

--
class
  PXTagName
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | m lock payload verb tag head tail pursi -> purso trailing

instance
  ( Sym.Cons q r tail
  , PXBody m lock payload verb q r pursi purso trailing
  , Sym.Cons x y trailing
  , PreEndTagFromTrailing x y tag newTrailing
  ) =>
  PXTagName m lock payload verb tag ">" tail pursi purso newTrailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "a" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "a" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "b" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "b" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "c" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "c" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "d" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "d" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "e" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "e" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "f" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "f" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "g" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "g" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "h" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "h" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "i" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "i" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "j" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "j" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "k" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "k" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "l" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "l" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "m" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "m" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "n" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "n" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "o" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "o" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "p" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "p" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "q" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "q" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "r" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "r" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "s" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "s" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "t" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "u" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "u" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "v" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "v" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "w" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "w" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "x" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "x" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "y" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "y" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "z" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "z" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "-" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "-" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "0" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "0" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "1" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "1" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "2" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "2" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "3" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "3" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "4" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "4" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "5" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "5" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "6" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "6" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "7" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "7" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "8" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "8" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "9" tag
  , PXTagName m lock payload verb tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag_ "9" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName m lock payload verb False tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag " " tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName m lock payload verb False tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag "\t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName m lock payload verb False tag x y pursi purso trailing
  ) =>
  PXTagName m lock payload verb tag "\n" tail pursi purso trailing

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
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | m lock payload verb hasAttributed tag head tail pursi -> purso trailing

instance
  ( Sym.Cons ">" trailing tail
  ) =>
  PXTagPreAttrName m
    lock
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
  , PXBody m lock payload verb q r pursi purso trailing
  , Sym.Cons x y trailing
  , PreEndTagFromTrailing x y tag newTrailing
  ) =>
  PXTagPreAttrName m
    lock
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
  , PXTagPreAttrName m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  , PXTagPreAttrName m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  , PXTagPreAttrName m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "a" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "b" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "c" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "d" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "e" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "f" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "g" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "h" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "i" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "j" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "k" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "l" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "m" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "n" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "o" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "p" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "q" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "r" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "s" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "t" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "u" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "v" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "w" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "x" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "y" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "z" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "A" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "B" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "C" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "D" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "E" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "F" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "G" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "H" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "I" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "J" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "K" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "L" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "M" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "N" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "O" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "P" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "Q" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "R" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "S" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "T" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "U" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "V" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "W" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "X" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "Y" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  ( PXTagAttrName m lock payload verb hasAttributed tag "Z" tail pursi purso
      trailing
  ) =>
  PXTagPreAttrName m
    lock
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
  , DoVerbForAttr verb tag "" x y pursi pursx newTail
  , Sym.Cons xx yy newTail
  , PXTagPreAttrName m lock payload verb True tag xx yy pursx purso trailing
  ) =>
  PXTagPreAttrName m lock payload verb False tag verb tail pursi purso trailing

--
class
  PXTagAttrName
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | m lock payload verb hasAttributed tag head tail pursi -> purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagAttrName m lock payload verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagPreAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagPostAttrName m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagPostAttrName m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName m
    lock
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
  , PXTagPostAttrName m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrName m
    lock
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
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | m lock payload verb hasAttributed tag head tail pursi -> purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPostAttrName m
    lock
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
  , PXTagPostAttrName m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPostAttrName m
    lock
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
  , PXTagPostAttrName m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPostAttrName m
    lock
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
  , PXTagPreAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPostAttrName m
    lock
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
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | m lock payload verb hasAttributed tag head tail pursi -> purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrValue m
    lock
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
  , PXTagPreAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrValue m
    lock
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
  , PXTagPreAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagPreAttrValue m
    lock
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
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | m lock payload verb hasAttributed tag head tail pursi -> purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagAttrValue m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
  , PXTagPreAttrName m lock payload verb hasAttributed tag x y pursi purso
      trailing
  ) =>
  PXTagAttrValue m
    lock
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
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | m lock payload verb tail pursi -> purso trailing

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
    (m :: Type -> Type)
    (lock :: Type)
    (payload :: Type)
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | m lock payload verb head tail pursi -> purso trailing

instance CloseOrRepeat m lock payload verb "/" tail purs purs tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody m lock payload verb mm bb pursi purso newTrailing
  ) =>
  CloseOrRepeat m lock payload verb "!" tail pursi purso newTrailing
else instance
  ( PXTagPreName m lock payload verb anything tail () pursm trailing
  , Row.Union pursi pursm pursz
  , Sym.Cons x y trailing
  , PXBody m lock payload verb x y pursz purso newTrailing
  ) =>
  CloseOrRepeat m lock payload verb anything tail pursi purso newTrailing

instance
  ( Sym.Cons x y tail
  , CloseOrRepeat m lock payload verb x y pursi purso trailing
  ) =>
  PXBody m lock payload verb "<" tail pursi purso trailing
else instance
  ( Sym.Cons x y tail
  , DoVerbForDOM m lock payload verb "" x y pursi pursx newTail
  , Sym.Cons xx yy newTail
  , PXBody m lock payload verb xx yy pursx purso trailing
  ) =>
  PXBody m lock payload verb verb tail pursi purso trailing
else instance
  ( Sym.Cons x y tail
  , PXBody m lock payload verb x y pursi purso trailing
  ) =>
  PXBody m lock payload verb anything tail pursi purso trailing

class
  PursxToElement lock payload (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> lock payload r where
  pursxToElement
    :: String
    -> Proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean, element :: Node lock payload }

instance pursxToElementConsInsert ::
  ( Row.Cons key (PursxElement lock payload) r' r
  , PursxToElement lock payload rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    lock
    payload
    (RL.Cons key (PursxElement lock payload) rest)
    r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) false cache
      , element: Node \info di ->
          __internalDekuFlatten
            { parent: Just (reflectType pxk <> pxScope)
            , scope: info.scope
            , raiseId: \_ -> pure unit
            }
            di
            pxe
            <|> (let Node y = element in y) info di
      }
    where
    pxk = Proxy :: _ key
    PursxElement pxe = get pxk r

else instance pursxToElementConsAttr ::
  ( Row.Cons key (AnEvent M (Attribute deku)) r' r
  , PursxToElement lock payload rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    lock
    payload
    (RL.Cons key (AnEvent M (Attribute deku)) rest)
    r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) true cache
      , element: Node \parent di@(DOMInterpret { setProp, setCb }) ->
          map
            ( lcmap unsafeUnAttribute
                ( \{ key, value } -> case value of
                    Prop' p -> setProp
                      { id: ((reflectType pxk) <> pxScope)
                      , key
                      , value: p
                      }
                    Cb' c -> setCb
                      { id: ((reflectType pxk) <> pxScope)
                      , key
                      , value: c
                      }
                )
            )
            (get pxk r)
            <|> (let Node y = element in y) parent di
      }
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  Applicative m =>
  PursxToElement lock payload RL.Nil r where
  pursxToElement _ _ _ = { cache: Object.empty, element: Node \_ _ -> empty }

psx
  :: forall lock payload (html :: Symbol)
   . Reflectable html String
  => PXStart M lock payload "~" " " html ()
  => PursxToElement lock payload RL.Nil ()
  => Proxy html
  -> Domable lock payload
psx px = makePursx px {}

makePursx
  :: forall lock payload (html :: Symbol) r rl
   . Reflectable html String
  => PXStart M lock payload "~" " " html r
  => RL.RowToList r rl
  => PursxToElement lock payload rl r
  => Proxy html
  -> { | r }
  -> Domable lock payload
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall lock payload verb (html :: Symbol) r rl
   . Reflectable html String
  => Reflectable verb String
  => PXStart M lock payload verb " " html r
  => RL.RowToList r rl
  => PursxToElement lock payload rl r
  => Proxy verb
  -> Proxy html
  -> { | r }
  -> Domable lock payload
makePursx' verb html r = Element' $ Node go
  where
  go
    z@{ parent, scope, raiseId }
    di@(DOMInterpret { makePursx: mpx, ids, deleteFromCache }) =
    makeEvent \k1 -> do
      me <- ids
      pxScope <- ids
      raiseId me
      let
        { cache, element: Node element } = pursxToElement
          pxScope
          (Proxy :: _ rl)
          r
      map ((*>) (k1 (deleteFromCache { id: me }))) $
        subscribe
          ( ( bang $
                mpx
                  { id: me
                  , parent
                  , cache
                  , pxScope: pxScope
                  , scope
                  , html: reflectType html
                  , verb: reflectType verb
                  }
            ) <|> element z di
          )
          k1

__internalDekuFlatten
  :: forall lock payload
   . PSR M
  -> DOMInterpret payload
  -> Domable lock payload
  -> AnEvent M payload
__internalDekuFlatten = Bolson.flatten
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> Element e
  }

infixr 5 makePursx as ~~

