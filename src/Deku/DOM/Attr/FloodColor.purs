module Deku.DOM.Attr.FloodColor where

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
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FloodColor = FloodColor

instance Attr FeBlend_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeBlend_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeBlend_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeColorMatrix_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeColorMatrix_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeColorMatrix_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeComponentTransfer_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeComponentTransfer_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeComponentTransfer_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeComposite_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeComposite_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeComposite_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeConvolveMatrix_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeConvolveMatrix_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeConvolveMatrix_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeDiffuseLighting_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeDiffuseLighting_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeDiffuseLighting_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeDisplacementMap_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeDisplacementMap_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeDisplacementMap_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeDropShadow_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeDropShadow_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeDropShadow_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeFlood_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeFlood_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeFlood_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeGaussianBlur_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeGaussianBlur_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeGaussianBlur_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeImage_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeImage_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeImage_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeMerge_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeMerge_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeMerge_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeMorphology_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeMorphology_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeMorphology_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeOffset_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeOffset_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeOffset_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeSpecularLighting_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeSpecularLighting_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeSpecularLighting_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeTile_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeTile_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeTile_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr FeTurbulence_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr FeTurbulence_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr FeTurbulence_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr Filter_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr Filter_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr Filter_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr Image_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr Image_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr Image_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr Switch_ FloodColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-color", value: prop' value })
instance Attr Switch_ FloodColor  String  where
  attr FloodColor value = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: prop' value }
instance Attr Switch_ FloodColor (Event.Event  String ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-color", value: prop' value }

instance Attr everything FloodColor (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FloodColor bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-color", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "flood-color", value: unset' })
instance Attr everything FloodColor  Unit  where
  attr FloodColor _ = unsafeAttribute $ This $ pure $
    { key: "flood-color", value: unset' }
instance Attr everything FloodColor (Event.Event  Unit ) where
  attr FloodColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "flood-color", value: unset' }
