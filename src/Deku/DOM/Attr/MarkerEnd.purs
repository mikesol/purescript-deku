module Deku.DOM.Attr.MarkerEnd where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

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

data MarkerEnd = MarkerEnd

instance Attr FeBlend_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeBlend_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeBlend_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeColorMatrix_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeColorMatrix_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeColorMatrix_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeComponentTransfer_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeComponentTransfer_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeComponentTransfer_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeComposite_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeComposite_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeComposite_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeConvolveMatrix_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeConvolveMatrix_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeConvolveMatrix_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeDiffuseLighting_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeDiffuseLighting_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeDiffuseLighting_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeDisplacementMap_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeDisplacementMap_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeDisplacementMap_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeFlood_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeFlood_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeFlood_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeGaussianBlur_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeGaussianBlur_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeGaussianBlur_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeImage_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeImage_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeImage_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeMerge_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeMerge_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeMerge_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeMorphology_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeMorphology_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeMorphology_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeOffset_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeOffset_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeOffset_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeSpecularLighting_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeSpecularLighting_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeSpecularLighting_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeTile_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeTile_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeTile_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr FeTurbulence_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr FeTurbulence_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr FeTurbulence_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr Filter_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr Filter_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr Filter_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr Image_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr Image_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr Image_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr Switch_ MarkerEnd (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-end", value: prop' value })
instance Attr Switch_ MarkerEnd  String  where
  attr MarkerEnd value = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: prop' value }
instance Attr Switch_ MarkerEnd (Event.Event  String ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-end", value: prop' value }

instance Attr everything MarkerEnd (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr MarkerEnd bothValues = unsafeAttribute $ Both
    { key: "marker-end", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "marker-end", value: unset' })
instance Attr everything MarkerEnd  Unit  where
  attr MarkerEnd _ = unsafeAttribute $ This $ pure $
    { key: "marker-end", value: unset' }
instance Attr everything MarkerEnd (Event.Event  Unit ) where
  attr MarkerEnd eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "marker-end", value: unset' }
