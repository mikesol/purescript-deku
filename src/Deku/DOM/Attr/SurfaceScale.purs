module Deku.DOM.Attr.SurfaceScale where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data SurfaceScale = SurfaceScale
instance Attr FeDiffuseLighting_ SurfaceScale  String  where
  attr SurfaceScale value = unsafeAttribute (  
    { key: "surfaceScale", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ SurfaceScale (Event.Event Unit -> Event.Event  String ) where
  attr SurfaceScale eventValue = unsafeAttribute (map (map (
    \value -> { key: "surfaceScale", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ SurfaceScale (Event.Event  String ) where
  attr SurfaceScale eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "surfaceScale", value: prop' value }
instance Attr FeSpecularLighting_ SurfaceScale  String  where
  attr SurfaceScale value = unsafeAttribute (  
    { key: "surfaceScale", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ SurfaceScale (Event.Event Unit -> Event.Event  String ) where
  attr SurfaceScale eventValue = unsafeAttribute (map (map (
    \value -> { key: "surfaceScale", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ SurfaceScale (Event.Event  String ) where
  attr SurfaceScale eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "surfaceScale", value: prop' value }
instance Attr everything SurfaceScale  Unit  where
  attr SurfaceScale _ = unsafeAttribute (  
    { key: "surfaceScale", value: unset'  } <$ _)
instance Attr everything SurfaceScale (Event.Event Unit -> Event.Event  Unit ) where
  attr SurfaceScale eventValue = unsafeAttribute (map (map (
    \_ -> { key: "surfaceScale", value: unset' })) eventValue)
instance Attr everything SurfaceScale (Event.Event  Unit ) where
  attr SurfaceScale eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "surfaceScale", value: unset' }