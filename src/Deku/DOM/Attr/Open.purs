module Deku.DOM.Attr.Open where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Details (Details_)
import Deku.DOM.Elt.Dialog (Dialog_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Open = Open

instance Attr Details_ Open (NonEmpty.NonEmpty Event.Event  String ) where
  attr Open bothValues = unsafeAttribute $ Both (pure 
    { key: "open", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "open", value: prop' value })
instance Attr Details_ Open (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Open (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "open", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "open", value: prop' value })
instance Attr Details_ Open  String  where
  attr Open value = unsafeAttribute $ This $ pure $
    { key: "open", value: prop' value }
instance Attr Details_ Open (Event.Event  String ) where
  attr Open eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "open", value: prop' value }

instance Attr Details_ Open (ST.ST Global.Global  String ) where
  attr Open iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "open", value: prop' value }

instance Attr Dialog_ Open (NonEmpty.NonEmpty Event.Event  String ) where
  attr Open bothValues = unsafeAttribute $ Both (pure 
    { key: "open", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "open", value: prop' value })
instance Attr Dialog_ Open (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Open (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "open", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "open", value: prop' value })
instance Attr Dialog_ Open  String  where
  attr Open value = unsafeAttribute $ This $ pure $
    { key: "open", value: prop' value }
instance Attr Dialog_ Open (Event.Event  String ) where
  attr Open eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "open", value: prop' value }

instance Attr Dialog_ Open (ST.ST Global.Global  String ) where
  attr Open iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "open", value: prop' value }

instance Attr everything Open (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Open bothValues = unsafeAttribute $ Both (pure  { key: "open", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "open", value: unset' })
instance Attr everything Open (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Open (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "open", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "open", value: unset' })
instance Attr everything Open  Unit  where
  attr Open _ = unsafeAttribute $ This $ { key: "open", value: unset' }
instance Attr everything Open (Event.Event  Unit ) where
  attr Open eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "open", value: unset' }

instance Attr everything Open (ST.ST Global.Global  Unit ) where
  attr Open iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "open", value: unset' }
