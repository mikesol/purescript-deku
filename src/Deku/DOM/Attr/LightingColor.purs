module Deku.DOM.Attr.LightingColor where


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

data LightingColor = LightingColor

instance Attr FeBlend_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeBlend_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeColorMatrix_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeComponentTransfer_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeComposite_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeComposite_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeConvolveMatrix_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeDiffuseLighting_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeDisplacementMap_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeFlood_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeFlood_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeGaussianBlur_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeImage_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeImage_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeMerge_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeMerge_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeMorphology_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeMorphology_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeOffset_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeOffset_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeSpecularLighting_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeTile_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeTile_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr FeTurbulence_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr FeTurbulence_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr Filter_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr Filter_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr Image_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr Image_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr Switch_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute (  
    { key: "lighting-color", value: prop' value  } <$ _)
instance Attr Switch_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }


instance Attr everything LightingColor  Unit  where
  attr LightingColor _ = unsafeAttribute (  
    { key: "lighting-color", value: unset'  } <$ _)
instance Attr everything LightingColor (Event.Event  Unit ) where
  attr LightingColor eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "lighting-color", value: unset' }
