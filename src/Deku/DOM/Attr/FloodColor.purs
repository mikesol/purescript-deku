module Deku.DOM.Attr.FloodColor where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data FloodColor = FloodColor
instance Attr FeBlend_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeBlend_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeBlend_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeColorMatrix_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeComponentTransfer_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeComposite_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeComposite_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeComposite_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeConvolveMatrix_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeDiffuseLighting_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeDisplacementMap_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeDropShadow_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeDropShadow_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeDropShadow_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeFlood_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeFlood_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeFlood_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeGaussianBlur_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeImage_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeImage_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeImage_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeMerge_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeMerge_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeMerge_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeMorphology_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeMorphology_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeMorphology_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeOffset_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeOffset_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeOffset_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeSpecularLighting_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeTile_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeTile_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeTile_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr FeTurbulence_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr FeTurbulence_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr FeTurbulence_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr Filter_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr Filter_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr Filter_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr Image_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr Image_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr Image_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr Switch_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute (  
    { key: "flood-color", value: prop' value  } <$ _)
instance Attr Switch_ FloodColor (Event.Event Unit -> Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \value -> { key: "flood-color", value: prop' value })) eventValue)
instance Attr Switch_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "flood-color", value: prop' value }
instance Attr everything FloodColor  Unit  where
  attr FloodColor _ = unsafeAttribute (  
    { key: "flood-color", value: unset'  } <$ _)
instance Attr everything FloodColor (Event.Event Unit -> Event.Event  Unit ) where
  attr FloodColor eventValue = unsafeAttribute (map (map (
    \_ -> { key: "flood-color", value: unset' })) eventValue)
instance Attr everything FloodColor (Event.Event  Unit ) where
  attr FloodColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "flood-color", value: unset' }