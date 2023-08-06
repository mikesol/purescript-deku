module Deku.DOM.Attr.Reversed where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Reversed = Reversed

instance Attr Ol_ Reversed (NonEmpty.NonEmpty Event.Event  String ) where
  attr Reversed bothValues = unsafeAttribute $ Both (pure 
    { key: "reversed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "reversed", value: prop' value })
instance Attr Ol_ Reversed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Reversed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "reversed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "reversed", value: prop' value })
instance Attr Ol_ Reversed  String  where
  attr Reversed value = unsafeAttribute $ This $ pure $
    { key: "reversed", value: prop' value }
instance Attr Ol_ Reversed (Event.Event  String ) where
  attr Reversed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "reversed", value: prop' value }

instance Attr Ol_ Reversed (ST.ST Global.Global  String ) where
  attr Reversed iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "reversed", value: prop' value }

instance Attr everything Reversed (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Reversed bothValues = unsafeAttribute $ Both (pure 
    { key: "reversed", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "reversed", value: unset' })
instance Attr everything Reversed (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Reversed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "reversed", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "reversed", value: unset' })
instance Attr everything Reversed  Unit  where
  attr Reversed _ = unsafeAttribute $ This $ pure $
    { key: "reversed", value: unset' }
instance Attr everything Reversed (Event.Event  Unit ) where
  attr Reversed eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "reversed", value: unset' }

instance Attr everything Reversed (ST.ST Global.Global  Unit ) where
  attr Reversed iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "reversed", value: unset' }
