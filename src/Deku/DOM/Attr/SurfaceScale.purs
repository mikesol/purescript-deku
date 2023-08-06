module Deku.DOM.Attr.SurfaceScale where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SurfaceScale = SurfaceScale

instance Attr FeDiffuseLighting_ SurfaceScale  String  where
  attr SurfaceScale value = unsafeAttribute $ Left $  
    { key: "surfaceScale", value: prop' value }
instance Attr FeDiffuseLighting_ SurfaceScale (Event.Event  String ) where
  attr SurfaceScale eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "surfaceScale", value: prop' value }


instance Attr FeSpecularLighting_ SurfaceScale  String  where
  attr SurfaceScale value = unsafeAttribute $ Left $  
    { key: "surfaceScale", value: prop' value }
instance Attr FeSpecularLighting_ SurfaceScale (Event.Event  String ) where
  attr SurfaceScale eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "surfaceScale", value: prop' value }


instance Attr everything SurfaceScale  Unit  where
  attr SurfaceScale _ = unsafeAttribute $ Left $  
    { key: "surfaceScale", value: unset' }
instance Attr everything SurfaceScale (Event.Event  Unit ) where
  attr SurfaceScale eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "surfaceScale", value: unset' }
