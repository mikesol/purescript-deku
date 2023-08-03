module Deku.DOM.Attr.FontSize where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

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

data FontSize = FontSize

instance Attr FeBlend_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeBlend_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeBlend_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeColorMatrix_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeColorMatrix_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeColorMatrix_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeComponentTransfer_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeComponentTransfer_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeComponentTransfer_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeComposite_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeComposite_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeComposite_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeConvolveMatrix_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeConvolveMatrix_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeConvolveMatrix_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeDiffuseLighting_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeDiffuseLighting_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeDiffuseLighting_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeDisplacementMap_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeDisplacementMap_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeDisplacementMap_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeFlood_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeFlood_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeFlood_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeGaussianBlur_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeGaussianBlur_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeGaussianBlur_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeImage_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeImage_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeImage_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeMerge_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeMerge_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeMerge_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeMorphology_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeMorphology_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeMorphology_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeOffset_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeOffset_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeOffset_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeSpecularLighting_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeSpecularLighting_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeSpecularLighting_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeTile_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeTile_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeTile_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeTurbulence_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeTurbulence_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeTurbulence_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Filter_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Filter_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr Filter_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Image_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Image_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr Image_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Switch_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Switch_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr Switch_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Text_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Text_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr Text_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Tspan_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Tspan_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr Tspan_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr everything FontSize (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FontSize bothValues = unsafeAttribute $ Both
    { key: "font-size", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "font-size", value: unset' })
instance Attr everything FontSize  Unit  where
  attr FontSize _ = unsafeAttribute $ This $ pure $
    { key: "font-size", value: unset' }
instance Attr everything FontSize (Event.Event  Unit ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "font-size", value: unset' }
