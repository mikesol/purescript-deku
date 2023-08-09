module Deku.DOM.Attr.WordSpacing where
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
data WordSpacing = WordSpacing
instance Attr FeBlend_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeBlend_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeBlend_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeColorMatrix_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeComponentTransfer_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeComposite_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeComposite_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeComposite_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeConvolveMatrix_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeDiffuseLighting_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeDisplacementMap_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeFlood_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeFlood_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeFlood_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeGaussianBlur_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeImage_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeImage_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeImage_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeMerge_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeMerge_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeMerge_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeMorphology_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeMorphology_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeMorphology_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeOffset_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeOffset_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeOffset_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeSpecularLighting_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeTile_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeTile_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeTile_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr FeTurbulence_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr FeTurbulence_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr FeTurbulence_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr Filter_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr Filter_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr Filter_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr Image_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr Image_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr Image_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr Switch_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute (  
    { key: "word-spacing", value: prop' value  } <$ _)
instance Attr Switch_ WordSpacing (Event.Event Unit -> Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \value -> { key: "word-spacing", value: prop' value })) eventValue)
instance Attr Switch_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }
instance Attr everything WordSpacing  Unit  where
  attr WordSpacing _ = unsafeAttribute (  
    { key: "word-spacing", value: unset'  } <$ _)
instance Attr everything WordSpacing (Event.Event Unit -> Event.Event  Unit ) where
  attr WordSpacing eventValue = unsafeAttribute (map (map (
    \_ -> { key: "word-spacing", value: unset' })) eventValue)
instance Attr everything WordSpacing (Event.Event  Unit ) where
  attr WordSpacing eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "word-spacing", value: unset' }