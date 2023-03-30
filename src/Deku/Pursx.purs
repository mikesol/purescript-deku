module Deku.Pursx where

import Prelude

import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), PSR)
import Control.Alt ((<|>))
import Control.Monad.ST.Uncurried (mkSTFn2, runSTFn1, runSTFn2)
import Control.Plus (empty)
import Data.Maybe (Maybe(..), maybe)
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import Data.Reflectable (class Reflectable, reflectType)
import Data.Symbol (class IsSymbol)
import Deku.Attribute (Attribute, AttributeValue(..), unsafeUnAttribute)
import Deku.Core (DOMInterpret(..), Nut(..), Nut', NutF(..), Node(..))
import Deku.DOM (class TagToDeku)
import FRP.Event (Event, Subscriber(..), merge, makeLemmingEventO)
import Foreign.Object as Object
import Prim.Boolean (False, True)
import Prim.Row as Row
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Safe.Coerce (coerce)
import Type.Proxy (Proxy(..))

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
  , Row.Cons acc (Event (Attribute deku)) pursi purso
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
    (verb :: Symbol)
    (acc :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (newTail :: Symbol)
  | verb acc head tail pursi -> purso newTail

instance
  ( Row.Cons acc (Nut) pursi purso
  ) =>
  DoVerbForDOM verb acc verb tail pursi purso tail
else instance
  ( Sym.Append acc anything acc2
  , Sym.Cons x y tail
  , DoVerbForDOM verb acc2 x y pursi purso newTail
  ) =>
  DoVerbForDOM verb acc anything tail pursi purso newTail

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
  PXStart (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (purs :: Row Type)
  | verb head tail -> purs

instance
  ( Sym.Cons x y tail
  , PXStart verb x y purs
  ) =>
  PXStart verb " " tail purs

instance
  ( Sym.Cons x y tail
  , PXStart verb x y purs
  ) =>
  PXStart verb "\t" tail purs

instance
  ( Sym.Cons x y tail
  , PXStart verb x y purs
  ) =>
  PXStart verb "\n" tail purs

instance
  ( Sym.Cons x y tail
  , PXTagPreName verb x y () purso trailing
  , IsWhiteSpace trailing
  ) =>
  PXStart verb "<" tail purso

--
class
  PXTagPreName
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | verb head tail pursi -> purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreName verb x y pursi purso trailing
  ) =>
  PXTagPreName verb " " tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreName verb x y pursi purso trailing
  ) =>
  PXTagPreName verb "\t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreName verb x y pursi purso trailing
  ) =>
  PXTagPreName verb "\n" tail pursi purso trailing

instance
  ( PXTagName verb "" "a" tail pursi purso trailing
  ) =>
  PXTagPreName verb "a" tail pursi purso trailing

instance
  ( PXTagName verb "" "b" tail pursi purso trailing
  ) =>
  PXTagPreName verb "b" tail pursi purso trailing

instance
  ( PXTagName verb "" "c" tail pursi purso trailing
  ) =>
  PXTagPreName verb "c" tail pursi purso trailing

instance
  ( PXTagName verb "" "d" tail pursi purso trailing
  ) =>
  PXTagPreName verb "d" tail pursi purso trailing

instance
  ( PXTagName verb "" "e" tail pursi purso trailing
  ) =>
  PXTagPreName verb "e" tail pursi purso trailing

instance
  ( PXTagName verb "" "f" tail pursi purso trailing
  ) =>
  PXTagPreName verb "f" tail pursi purso trailing

instance
  ( PXTagName verb "" "g" tail pursi purso trailing
  ) =>
  PXTagPreName verb "g" tail pursi purso trailing

instance
  ( PXTagName verb "" "h" tail pursi purso trailing
  ) =>
  PXTagPreName verb "h" tail pursi purso trailing

instance
  ( PXTagName verb "" "i" tail pursi purso trailing
  ) =>
  PXTagPreName verb "i" tail pursi purso trailing

instance
  ( PXTagName verb "" "j" tail pursi purso trailing
  ) =>
  PXTagPreName verb "j" tail pursi purso trailing

instance
  ( PXTagName verb "" "k" tail pursi purso trailing
  ) =>
  PXTagPreName verb "k" tail pursi purso trailing

instance
  ( PXTagName verb "" "l" tail pursi purso trailing
  ) =>
  PXTagPreName verb "l" tail pursi purso trailing

instance
  ( PXTagName verb "" "m" tail pursi purso trailing
  ) =>
  PXTagPreName verb "m" tail pursi purso trailing

instance
  ( PXTagName verb "" "n" tail pursi purso trailing
  ) =>
  PXTagPreName verb "n" tail pursi purso trailing

instance
  ( PXTagName verb "" "o" tail pursi purso trailing
  ) =>
  PXTagPreName verb "o" tail pursi purso trailing

instance
  ( PXTagName verb "" "p" tail pursi purso trailing
  ) =>
  PXTagPreName verb "p" tail pursi purso trailing

instance
  ( PXTagName verb "" "q" tail pursi purso trailing
  ) =>
  PXTagPreName verb "q" tail pursi purso trailing

instance
  ( PXTagName verb "" "r" tail pursi purso trailing
  ) =>
  PXTagPreName verb "r" tail pursi purso trailing

instance
  ( PXTagName verb "" "s" tail pursi purso trailing
  ) =>
  PXTagPreName verb "s" tail pursi purso trailing

instance
  ( PXTagName verb "" "t" tail pursi purso trailing
  ) =>
  PXTagPreName verb "t" tail pursi purso trailing

instance
  ( PXTagName verb "" "u" tail pursi purso trailing
  ) =>
  PXTagPreName verb "u" tail pursi purso trailing

instance
  ( PXTagName verb "" "v" tail pursi purso trailing
  ) =>
  PXTagPreName verb "v" tail pursi purso trailing

instance
  ( PXTagName verb "" "w" tail pursi purso trailing
  ) =>
  PXTagPreName verb "w" tail pursi purso trailing

instance
  ( PXTagName verb "" "x" tail pursi purso trailing
  ) =>
  PXTagPreName verb "x" tail pursi purso trailing

instance
  ( PXTagName verb "" "y" tail pursi purso trailing
  ) =>
  PXTagPreName verb "y" tail pursi purso trailing

instance
  ( PXTagName verb "" "z" tail pursi purso trailing
  ) =>
  PXTagPreName verb "z" tail pursi purso trailing

--
class
  PXTagName
    (verb :: Symbol)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | verb tag head tail pursi -> purso trailing

instance
  ( Sym.Cons q r tail
  , PXBody verb q r pursi purso trailing
  , Sym.Cons x y trailing
  , PreEndTagFromTrailing x y tag newTrailing
  ) =>
  PXTagName verb tag ">" tail pursi purso newTrailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "a" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "a" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "b" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "b" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "c" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "c" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "d" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "d" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "e" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "e" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "f" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "f" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "g" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "g" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "h" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "h" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "i" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "i" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "j" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "j" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "k" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "k" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "l" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "l" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "m" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "m" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "n" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "n" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "o" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "o" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "p" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "p" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "q" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "q" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "r" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "r" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "s" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "s" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "t" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "u" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "u" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "v" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "v" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "w" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "w" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "x" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "x" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "y" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "y" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "z" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "z" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "-" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "-" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "0" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "0" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "1" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "1" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "2" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "2" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "3" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "3" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "4" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "4" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "5" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "5" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "6" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "6" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "7" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "7" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "8" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "8" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , Sym.Append tag_ "9" tag
  , PXTagName verb tag x y pursi purso trailing
  ) =>
  PXTagName verb tag_ "9" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb False tag x y pursi purso trailing
  ) =>
  PXTagName verb tag " " tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb False tag x y pursi purso trailing
  ) =>
  PXTagName verb tag "\t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb False tag x y pursi purso trailing
  ) =>
  PXTagName verb tag "\n" tail pursi purso trailing

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
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | verb hasAttributed tag head tail pursi -> purso trailing

instance
  ( Sym.Cons ">" trailing tail
  ) =>
  PXTagPreAttrName verb hasAttributed tag "/" tail purs purs trailing
-- trailing will be by definition whatever comes after the closing tag, ie </ foo> will be " foo>"
else instance
  ( Sym.Cons q r tail
  , PXBody verb q r pursi purso trailing
  , Sym.Cons x y trailing
  , PreEndTagFromTrailing x y tag newTrailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag ">" tail pursi purso newTrailing
--
else instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag " " tail pursi purso trailing
else instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "\t" tail pursi purso trailing
else instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "\n" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "a" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "a" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "b" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "b" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "c" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "c" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "d" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "d" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "e" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "e" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "f" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "f" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "g" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "g" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "h" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "h" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "i" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "i" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "j" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "j" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "k" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "k" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "l" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "l" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "m" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "m" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "n" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "n" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "o" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "o" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "p" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "p" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "q" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "q" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "r" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "r" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "s" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "s" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "t" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "t" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "u" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "u" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "v" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "v" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "w" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "w" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "x" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "x" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "y" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "y" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "z" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "z" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "A" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "A" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "B" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "B" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "C" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "C" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "D" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "D" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "E" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "E" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "F" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "F" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "G" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "G" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "H" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "H" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "I" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "I" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "J" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "J" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "K" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "K" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "L" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "L" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "M" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "M" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "N" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "N" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "O" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "O" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "P" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "P" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "Q" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "Q" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "R" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "R" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "S" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "S" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "T" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "T" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "U" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "U" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "V" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "V" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "W" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "W" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "X" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "X" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "Y" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "Y" tail pursi purso trailing
else instance
  ( PXTagAttrName verb hasAttributed tag "Z" tail pursi purso trailing
  ) =>
  PXTagPreAttrName verb hasAttributed tag "Z" tail pursi purso trailing
else instance
  ( Sym.Cons x y tail
  , DoVerbForAttr verb tag "" x y pursi pursx newTail
  , Sym.Cons xx yy newTail
  , PXTagPreAttrName verb True tag xx yy pursx purso trailing
  ) =>
  PXTagPreAttrName verb False tag verb tail pursi purso trailing

--
class
  PXTagAttrName
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | verb hasAttributed tag head tail pursi -> purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "a" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "b" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "c" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "d" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "e" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "f" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "g" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "h" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "i" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "j" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "k" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "l" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "m" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "n" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "o" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "p" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "q" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "r" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "s" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "u" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "v" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "w" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "x" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "y" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "z" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "A" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "B" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "C" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "D" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "E" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "F" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "G" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "H" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "I" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "J" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "K" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "L" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "M" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "N" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "O" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "P" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "Q" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "R" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "S" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "T" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "U" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "V" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "W" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "X" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "Y" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "Z" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "-" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "0" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "1" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "2" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "3" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "4" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "5" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "6" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "7" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "8" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "9" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "=" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag " " tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "\t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrName verb hasAttributed tag "\n" tail pursi purso trailing

--
class
  PXTagPostAttrName
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | verb hasAttributed tag head tail pursi -> purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPostAttrName verb hasAttributed tag " " tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPostAttrName verb hasAttributed tag "\t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPostAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPostAttrName verb hasAttributed tag "\n" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPostAttrName verb hasAttributed tag "=" tail pursi purso trailing

--
class
  PXTagPreAttrValue
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | verb hasAttributed tag head tail pursi -> purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPreAttrValue verb hasAttributed tag " " tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPreAttrValue verb hasAttributed tag "\t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPreAttrValue verb hasAttributed tag "\n" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagPreAttrValue verb hasAttributed tag "\"" tail pursi purso trailing

--
class
  PXTagAttrValue
    (verb :: Symbol)
    (hasAttributed :: Boolean)
    (tag :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | verb hasAttributed tag head tail pursi -> purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "a" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "b" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "c" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "d" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "e" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "f" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "g" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "h" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "i" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "j" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "k" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "l" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "m" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "n" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "o" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "p" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "q" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "r" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "s" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "u" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "v" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "w" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "x" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "y" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "z" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "A" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "B" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "C" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "D" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "E" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "F" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "G" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "H" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "I" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "J" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "K" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "L" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "M" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "N" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "O" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "P" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "Q" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "R" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "S" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "T" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "U" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "V" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "W" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "X" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "Y" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "Z" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "0" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "1" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "2" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "3" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "4" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "5" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "6" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "7" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "8" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "9" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag ":" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "," tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag ";" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "'" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "!" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "?" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "@" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "#" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "$" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "%" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "^" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "&" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "*" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "(" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag ")" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "_" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "-" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "=" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "`" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "~" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "<" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag ">" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "/" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "." tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "\\" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag " " tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "\t" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagAttrValue verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "\n" tail pursi purso trailing

instance
  ( Sym.Cons x y tail
  , PXTagPreAttrName verb hasAttributed tag x y pursi purso trailing
  ) =>
  PXTagAttrValue verb hasAttributed tag "\"" tail pursi purso trailing

class
  PXBody
    (verb :: Symbol)
    (head :: Symbol)
    (tail :: Symbol)
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | verb tail pursi -> purso trailing

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
    (pursi :: Row Type)
    (purso :: Row Type)
    (trailing :: Symbol)
  | verb head tail pursi -> purso trailing

instance CloseOrRepeat verb "/" tail purs purs tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody verb mm bb pursi purso newTrailing
  ) =>
  CloseOrRepeat verb "!" tail pursi purso newTrailing
else instance
  ( PXTagPreName verb anything tail () pursm trailing
  , Row.Union pursi pursm pursz
  , Sym.Cons x y trailing
  , PXBody verb x y pursz purso newTrailing
  ) =>
  CloseOrRepeat verb anything tail pursi purso newTrailing

instance
  ( Sym.Cons x y tail
  , CloseOrRepeat verb x y pursi purso trailing
  ) =>
  PXBody verb "<" tail pursi purso trailing
else instance
  ( Sym.Cons x y tail
  , DoVerbForDOM verb "" x y pursi pursx newTail
  , Sym.Cons xx yy newTail
  , PXBody verb xx yy pursx purso trailing
  ) =>
  PXBody verb verb tail pursi purso trailing
else instance
  ( Sym.Cons x y tail
  , PXBody verb x y pursi purso trailing
  ) =>
  PXBody verb anything tail pursi purso trailing

class
  PursxToElement (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> r where
  pursxToElement
    :: String
    -> Proxy rl
    -> { | r }
    -> { cache :: Object.Object Boolean, element :: Nut }

domableToNode :: Nut -> forall payload. Node payload
domableToNode (Nut df) = step1 df
  where
  step1 :: forall payload. NutF payload -> Node payload
  step1 (NutF (Element' n)) = n
  step1 _ = Node \_ _ -> empty

instance pursxToElementConsInsert ::
  ( Row.Cons key (Nut) r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key (Nut) rest)
    r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) false cache
      , element: Nut
          ( NutF
              ( Element' $ Node \info di ->
                  __internalDekuFlatten
                    { parent: Just (reflectType pxk <> "@!%" <> pxScope)
                    , scope: info.scope
                    , raiseId: \_ -> pure unit
                    , pos: info.pos
                    , ez: false
                    , dynFamily: Nothing
                    }
                    di
                    ((\(Nut df) -> df) (get pxk r))
                    <|> (let Node y = (domableToNode element) in y) info di
              )
          )
      }
    where
    pxk = Proxy :: _ key

else instance pursxToElementConsAttr ::
  ( Row.Cons key (Event (Attribute deku)) r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key (Event (Attribute deku)) rest)
    r where
  pursxToElement pxScope _ r =
    let
      { cache, element } = pursxToElement pxScope (Proxy :: Proxy rest) r
    in
      { cache: Object.insert (reflectType pxk) true cache
      , element: Nut
          ( NutF
              ( Element'
                  ( Node
                      \parent
                       di@(DOMInterpret { setProp, setCb, unsetAttribute }) ->
                        map
                          ( lcmap unsafeUnAttribute
                              ( \{ key, value } -> case value of
                                  Prop' p -> setProp
                                    { id:
                                        ((reflectType pxk) <> "@!%" <> pxScope)
                                    , key
                                    , value: p
                                    }
                                  Cb' c -> setCb
                                    { id:
                                        ((reflectType pxk) <> "@!%" <> pxScope)
                                    , key
                                    , value: c
                                    }
                                  Unset' -> unsetAttribute
                                    { id:
                                        ((reflectType pxk) <> "@!%" <> pxScope)
                                    , key
                                    }
                              )
                          )
                          (get pxk r)
                          <|> (let Node y = (domableToNode element) in y) parent
                            di
                  )
              )
          )
      }
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  PursxToElement RL.Nil r where
  pursxToElement _ _ _ =
    { cache: Object.empty
    , element: Nut (NutF $ Element' $ Node \_ _ -> empty)
    }

psx
  :: forall (html :: Symbol)
   . Reflectable html String
  => PXStart "~" " " html ()
  => PursxToElement RL.Nil ()
  => Proxy html
  -> Nut
psx px = makePursx px {}

makePursx
  :: forall (html :: Symbol) r rl
   . Reflectable html String
  => PXStart "~" " " html r
  => RL.RowToList r rl
  => PursxToElement rl r
  => Proxy html
  -> { | r }
  -> Nut
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall verb (html :: Symbol) r rl
   . Reflectable html String
  => Reflectable verb String
  => PXStart verb " " html r
  => RL.RowToList r rl
  => PursxToElement rl r
  => Proxy verb
  -> Proxy html
  -> { | r }
  -> Nut
makePursx' verb html r = Nut ee
  where
  ee :: forall payload. NutF payload
  ee = NutF (Element' (Node go))

  go
    :: forall payload
     . PSR (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)
    -> DOMInterpret payload
    -> Event payload
  go
    z@{ parent, scope, raiseId, dynFamily, pos }
    di@(DOMInterpret { makePursx: mpx, ids, deleteFromCache, attributeParent }) =
    makeLemmingEventO $ mkSTFn2 \(Subscriber mySub) k1 -> do
      me <- ids
      pxScope <- ids
      raiseId me
      let
        { cache, element: element' } = pursxToElement
          pxScope
          (Proxy :: _ rl)
          r
      let Node element = domableToNode element'
      unsub <- runSTFn2 mySub
        ( merge
            [ pure $
                mpx
                  { id: me
                  , parent
                  , cache
                  , dynFamily
                  , pos
                  , pxScope: pxScope
                  , scope
                  , html: reflectType html
                  , verb: reflectType verb
                  }
            , element z di
            , maybe empty
                ( \p ->
                    pure $ attributeParent
                      { id: me, parent: p, pos, dynFamily, ez: false }
                )
                parent
            ]
        )
        k1
      pure do
        runSTFn1 k1 (deleteFromCache { id: me })
        unsub

unsafeMakePursx
  :: forall r rl
   . RL.RowToList r rl
  => PursxToElement rl r
  => String
  -> { | r }
  -> Nut
unsafeMakePursx = unsafeMakePursx' "~"

unsafeMakePursx'
  :: forall r rl
   . RL.RowToList r rl
  => PursxToElement rl r
  => String
  -> String
  -> { | r }
  -> Nut
unsafeMakePursx' verb html r = Nut ee
  where
  ee :: forall payload. NutF payload
  ee = NutF (Element' (Node go))

  go
    :: forall payload
     . PSR (pos :: Maybe Int, ez :: Boolean, dynFamily :: Maybe String)
    -> DOMInterpret payload
    -> Event payload
  go
    z@{ parent, scope, raiseId, dynFamily, pos }
    di@(DOMInterpret { makePursx: mpx, ids, deleteFromCache, attributeParent }) =
    makeLemmingEventO $ mkSTFn2 \(Subscriber mySub) k1 -> do
      me <- ids
      pxScope <- ids
      raiseId me
      let
        { cache, element: element' } = pursxToElement
          pxScope
          (Proxy :: _ rl)
          r
      let Node element = domableToNode element'
      unsub <- runSTFn2 mySub
        ( merge
            [ pure $
                mpx
                  { id: me
                  , parent
                  , cache
                  , dynFamily
                  , pos
                  , pxScope: pxScope
                  , scope
                  , html
                  , verb
                  }
            , element z di
            , maybe empty
                ( \p ->
                    pure $ attributeParent
                      { id: me, parent: p, pos, dynFamily, ez: false }
                )
                parent
            ]
        )
        k1
      pure do
        runSTFn1 k1 (deleteFromCache { id: me })
        unsub

__internalDekuFlatten
  :: forall payload
   . PSR (pos :: Maybe Int, dynFamily :: Maybe String, ez :: Boolean)
  -> DOMInterpret payload
  -> NutF payload
  -> Event payload
__internalDekuFlatten a b c = Bolson.flatten
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> Element e
  }
  a
  b
  ((coerce :: NutF payload -> Nut' payload) c)

infixr 5 makePursx as ~~
infixr 5 unsafeMakePursx as ~!~

