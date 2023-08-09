module Deku.DOM.Attr.FontStyle where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
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
data FontStyle = FontStyle
instance Attr FeBlend_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeBlend_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeBlend_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeColorMatrix_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeComponentTransfer_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeComposite_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeComposite_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeComposite_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeConvolveMatrix_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeDiffuseLighting_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeDisplacementMap_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeFlood_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeFlood_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeFlood_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeGaussianBlur_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeImage_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeImage_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeImage_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeMerge_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeMerge_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeMerge_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeMorphology_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeMorphology_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeMorphology_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeOffset_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeOffset_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeOffset_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeSpecularLighting_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeTile_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeTile_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeTile_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr FeTurbulence_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr FeTurbulence_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr FeTurbulence_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr Filter_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr Filter_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr Filter_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr Image_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr Image_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr Image_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr Switch_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr Switch_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr Switch_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr Text_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr Text_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr Text_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr Tspan_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute (  
    { key: "font-style", value: prop' value  } <$ _)
instance Attr Tspan_ FontStyle (Event.Event Unit -> Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \value -> { key: "font-style", value: prop' value })) eventValue)
instance Attr Tspan_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "font-style", value: prop' value }
instance Attr everything FontStyle  Unit  where
  attr FontStyle _ = unsafeAttribute (  
    { key: "font-style", value: unset'  } <$ _)
instance Attr everything FontStyle (Event.Event Unit -> Event.Event  Unit ) where
  attr FontStyle eventValue = unsafeAttribute (map (map (
    \_ -> { key: "font-style", value: unset' })) eventValue)
instance Attr everything FontStyle (Event.Event  Unit ) where
  attr FontStyle eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "font-style", value: unset' }