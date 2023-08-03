module Deku.DOM.Attr.Height where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
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
import Deku.DOM.Elt.Canvas (Canvas_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Height = Height

instance Attr Canvas_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Canvas_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Canvas_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Embed_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Embed_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Embed_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Iframe_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Iframe_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Iframe_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Img_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Img_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Img_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Input_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Input_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Input_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Object_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Object_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Object_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Video_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Video_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Video_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeBlend_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeBlend_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeBlend_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeColorMatrix_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeColorMatrix_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeColorMatrix_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeComponentTransfer_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeComponentTransfer_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeComponentTransfer_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeComposite_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeComposite_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeComposite_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeConvolveMatrix_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeConvolveMatrix_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeConvolveMatrix_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeDiffuseLighting_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeDiffuseLighting_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeDiffuseLighting_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeDisplacementMap_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeDisplacementMap_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeDisplacementMap_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeDropShadow_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeDropShadow_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeDropShadow_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeFlood_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeFlood_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeFlood_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeGaussianBlur_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeGaussianBlur_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeGaussianBlur_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeImage_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeImage_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeImage_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeMerge_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeMerge_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeMerge_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeMorphology_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeMorphology_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeMorphology_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeOffset_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeOffset_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeOffset_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeSpecularLighting_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeSpecularLighting_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeSpecularLighting_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeTile_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeTile_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeTile_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr FeTurbulence_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr FeTurbulence_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr FeTurbulence_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Filter_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Filter_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Filter_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr ForeignObject_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr ForeignObject_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr ForeignObject_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Image_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Image_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Image_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Mask_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Mask_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Mask_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Pattern_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Pattern_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Pattern_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Rect_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Rect_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Rect_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Svg_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Svg_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Svg_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Symbol_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Symbol_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Symbol_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr Use_ Height (NonEmpty.NonEmpty Event.Event  String ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "height", value: prop' value })
instance Attr Use_ Height  String  where
  attr Height value = unsafeAttribute $ This $ pure $
    { key: "height", value: prop' value }
instance Attr Use_ Height (Event.Event  String ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "height", value: prop' value }

instance Attr everything Height (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Height bothValues = unsafeAttribute $ Both
    { key: "height", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "height", value: unset' })
instance Attr everything Height  Unit  where
  attr Height _ = unsafeAttribute $ This $ pure $ { key: "height", value: unset' }
instance Attr everything Height (Event.Event  Unit ) where
  attr Height eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "height", value: unset' }
