module Deku.DOM.Attr.Direction where
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
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Direction = Direction
instance Attr FeBlend_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeBlend_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeBlend_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeColorMatrix_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeComponentTransfer_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeComposite_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeComposite_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeComposite_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeConvolveMatrix_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeDiffuseLighting_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeDisplacementMap_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeFlood_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeFlood_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeFlood_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeGaussianBlur_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeImage_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeImage_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeImage_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeMerge_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeMerge_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeMerge_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeMorphology_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeMorphology_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeMorphology_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeOffset_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeOffset_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeOffset_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeSpecularLighting_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeTile_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeTile_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeTile_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr FeTurbulence_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr FeTurbulence_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr FeTurbulence_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr Filter_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr Filter_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr Filter_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr Image_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr Image_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr Image_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr Switch_ Direction  String  where
  attr Direction value = unsafeAttribute (  
    { key: "direction", value: prop' value  } <$ _)
instance Attr Switch_ Direction (Event.Event Unit -> Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \value -> { key: "direction", value: prop' value })) eventValue)
instance Attr Switch_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "direction", value: prop' value }
instance Attr everything Direction  Unit  where
  attr Direction _ = unsafeAttribute (  
    { key: "direction", value: unset'  } <$ _)
instance Attr everything Direction (Event.Event Unit -> Event.Event  Unit ) where
  attr Direction eventValue = unsafeAttribute (map (map (
    \_ -> { key: "direction", value: unset' })) eventValue)
instance Attr everything Direction (Event.Event  Unit ) where
  attr Direction eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "direction", value: unset' }