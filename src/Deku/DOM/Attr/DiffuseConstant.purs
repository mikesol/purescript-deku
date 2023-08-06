module Deku.DOM.Attr.DiffuseConstant where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data DiffuseConstant = DiffuseConstant

instance Attr FeDiffuseLighting_ DiffuseConstant  String  where
  attr DiffuseConstant value = unsafeAttribute $ Left $  
    { key: "diffuseConstant", value: prop' value }
instance Attr FeDiffuseLighting_ DiffuseConstant (Event.Event  String ) where
  attr DiffuseConstant eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "diffuseConstant", value: prop' value }


instance Attr everything DiffuseConstant  Unit  where
  attr DiffuseConstant _ = unsafeAttribute $ Left $  
    { key: "diffuseConstant", value: unset' }
instance Attr everything DiffuseConstant (Event.Event  Unit ) where
  attr DiffuseConstant eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "diffuseConstant", value: unset' }
