module Deku.DOM.Attr.TextRendering where
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
data TextRendering = TextRendering
instance Attr FeBlend_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeBlend_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeBlend_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeColorMatrix_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeComponentTransfer_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeComposite_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeComposite_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeComposite_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeConvolveMatrix_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeDiffuseLighting_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeDisplacementMap_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeFlood_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeFlood_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeFlood_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeGaussianBlur_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeImage_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeImage_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeImage_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeMerge_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeMerge_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeMerge_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeMorphology_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeMorphology_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeMorphology_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeOffset_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeOffset_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeOffset_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeSpecularLighting_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeTile_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeTile_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeTile_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr FeTurbulence_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr FeTurbulence_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr FeTurbulence_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr Filter_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr Filter_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr Filter_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr Image_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr Image_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr Image_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr Switch_ TextRendering  String  where
  attr TextRendering value = unsafeAttribute (  
    { key: "text-rendering", value: prop' value  } <$ _)
instance Attr Switch_ TextRendering (Event.Event Unit -> Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \value -> { key: "text-rendering", value: prop' value })) eventValue)
instance Attr Switch_ TextRendering (Event.Event  String ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "text-rendering", value: prop' value }
instance Attr everything TextRendering  Unit  where
  attr TextRendering _ = unsafeAttribute (  
    { key: "text-rendering", value: unset'  } <$ _)
instance Attr everything TextRendering (Event.Event Unit -> Event.Event  Unit ) where
  attr TextRendering eventValue = unsafeAttribute (map (map (
    \_ -> { key: "text-rendering", value: unset' })) eventValue)
instance Attr everything TextRendering (Event.Event  Unit ) where
  attr TextRendering eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "text-rendering", value: unset' }