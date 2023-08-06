module Deku.DOM.Attr.AttributeType where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AttributeType = AttributeType

instance Attr AnimateTransform_ AttributeType (NonEmpty.NonEmpty Event.Event  String ) where
  attr AttributeType bothValues = unsafeAttribute $ Both (pure 
    { key: "attributeType", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "attributeType", value: prop' value })
instance Attr AnimateTransform_ AttributeType (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AttributeType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "attributeType", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "attributeType", value: prop' value })
instance Attr AnimateTransform_ AttributeType  String  where
  attr AttributeType value = unsafeAttribute $ This $ pure $
    { key: "attributeType", value: prop' value }
instance Attr AnimateTransform_ AttributeType (Event.Event  String ) where
  attr AttributeType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "attributeType", value: prop' value }

instance Attr AnimateTransform_ AttributeType (ST.ST Global.Global  String ) where
  attr AttributeType iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "attributeType", value: prop' value }

instance Attr everything AttributeType (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AttributeType bothValues = unsafeAttribute $ Both (pure 
    { key: "attributeType", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "attributeType", value: unset' })
instance Attr everything AttributeType (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AttributeType (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "attributeType", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "attributeType", value: unset' })
instance Attr everything AttributeType  Unit  where
  attr AttributeType _ = unsafeAttribute $ This $ pure $
    { key: "attributeType", value: unset' }
instance Attr everything AttributeType (Event.Event  Unit ) where
  attr AttributeType eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "attributeType", value: unset' }

instance Attr everything AttributeType (ST.ST Global.Global  Unit ) where
  attr AttributeType iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "attributeType", value: unset' }
