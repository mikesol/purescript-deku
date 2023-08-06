module Deku.DOM.Attr.Z where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Z = Z

instance Attr FePointLight_ Z  String  where
  attr Z value = unsafeAttribute $ Left $  { key: "z", value: prop' value }
instance Attr FePointLight_ Z (Event.Event  String ) where
  attr Z eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "z", value: prop' value }


instance Attr FeSpotLight_ Z  String  where
  attr Z value = unsafeAttribute $ Left $  { key: "z", value: prop' value }
instance Attr FeSpotLight_ Z (Event.Event  String ) where
  attr Z eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "z", value: prop' value }


instance Attr everything Z  Unit  where
  attr Z _ = unsafeAttribute $ Left $  { key: "z", value: unset' }
instance Attr everything Z (Event.Event  Unit ) where
  attr Z eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "z", value: unset' }
