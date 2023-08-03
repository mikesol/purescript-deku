module Deku.DOM.Attr.SpecularConstant where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpecularConstant = SpecularConstant

instance Attr FeSpecularLighting_ SpecularConstant (NonEmpty.NonEmpty Event.Event  String ) where
  attr SpecularConstant bothValues = unsafeAttribute $ Both (pure 
    { key: "specularConstant", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "specularConstant", value: prop' value }
    )
instance Attr FeSpecularLighting_ SpecularConstant  String  where
  attr SpecularConstant value = unsafeAttribute $ This $ pure $
    { key: "specularConstant", value: prop' value }
instance Attr FeSpecularLighting_ SpecularConstant (Event.Event  String ) where
  attr SpecularConstant eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "specularConstant", value: prop' value }

instance Attr everything SpecularConstant (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr SpecularConstant bothValues = unsafeAttribute $ Both (pure 
    { key: "specularConstant", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "specularConstant", value: unset' })
instance Attr everything SpecularConstant  Unit  where
  attr SpecularConstant _ = unsafeAttribute $ This $ pure $
    { key: "specularConstant", value: unset' }
instance Attr everything SpecularConstant (Event.Event  Unit ) where
  attr SpecularConstant eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "specularConstant", value: unset' }
