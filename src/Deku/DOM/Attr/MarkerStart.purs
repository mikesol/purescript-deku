module Deku.DOM.Attr.MarkerStart where
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
data MarkerStart = MarkerStart
instance Attr FeBlend_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeBlend_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeBlend_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeColorMatrix_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeComponentTransfer_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeComposite_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeComposite_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeComposite_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeConvolveMatrix_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeDiffuseLighting_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeDisplacementMap_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeFlood_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeFlood_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeFlood_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeGaussianBlur_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeImage_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeImage_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeImage_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeMerge_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeMerge_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeMerge_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeMorphology_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeMorphology_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeMorphology_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeOffset_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeOffset_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeOffset_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeSpecularLighting_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeTile_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeTile_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeTile_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr FeTurbulence_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr FeTurbulence_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr FeTurbulence_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr Filter_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr Filter_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr Filter_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr Image_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr Image_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr Image_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr Switch_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute (  
    { key: "marker-start", value: prop' value  } <$ _)
instance Attr Switch_ MarkerStart (Event.Event Unit -> Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \value -> { key: "marker-start", value: prop' value })) eventValue)
instance Attr Switch_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "marker-start", value: prop' value }
instance Attr everything MarkerStart  Unit  where
  attr MarkerStart _ = unsafeAttribute (  
    { key: "marker-start", value: unset'  } <$ _)
instance Attr everything MarkerStart (Event.Event Unit -> Event.Event  Unit ) where
  attr MarkerStart eventValue = unsafeAttribute (map (map (
    \_ -> { key: "marker-start", value: unset' })) eventValue)
instance Attr everything MarkerStart (Event.Event  Unit ) where
  attr MarkerStart eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "marker-start", value: unset' }