module Deku.DOM.Attr.WritingMode where
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
data WritingMode = WritingMode
instance Attr FeBlend_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeBlend_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeBlend_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeColorMatrix_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeComponentTransfer_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeComposite_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeComposite_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeComposite_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeConvolveMatrix_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeDiffuseLighting_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeDisplacementMap_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeFlood_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeFlood_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeFlood_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeGaussianBlur_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeImage_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeImage_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeImage_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeMerge_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeMerge_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeMerge_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeMorphology_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeMorphology_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeMorphology_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeOffset_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeOffset_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeOffset_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeSpecularLighting_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeTile_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeTile_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeTile_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr FeTurbulence_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr FeTurbulence_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr FeTurbulence_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr Filter_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr Filter_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr Filter_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr Image_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr Image_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr Image_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr Switch_ WritingMode  String  where
  attr WritingMode value = unsafeAttribute (  
    { key: "writing-mode", value: prop' value  } <$ _)
instance Attr Switch_ WritingMode (Event.Event Unit -> Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \value -> { key: "writing-mode", value: prop' value })) eventValue)
instance Attr Switch_ WritingMode (Event.Event  String ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "writing-mode", value: prop' value }
instance Attr everything WritingMode  Unit  where
  attr WritingMode _ = unsafeAttribute (  
    { key: "writing-mode", value: unset'  } <$ _)
instance Attr everything WritingMode (Event.Event Unit -> Event.Event  Unit ) where
  attr WritingMode eventValue = unsafeAttribute (map (map (
    \_ -> { key: "writing-mode", value: unset' })) eventValue)
instance Attr everything WritingMode (Event.Event  Unit ) where
  attr WritingMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "writing-mode", value: unset' }