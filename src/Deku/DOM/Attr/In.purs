module Deku.DOM.Attr.In where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMergeNode (FeMergeNode_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data In = In

instance Attr FeBlend_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeBlend_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeBlend_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeColorMatrix_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeColorMatrix_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeColorMatrix_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeComponentTransfer_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeComponentTransfer_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeComponentTransfer_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeComposite_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeComposite_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeComposite_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeConvolveMatrix_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeConvolveMatrix_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeConvolveMatrix_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeDiffuseLighting_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeDiffuseLighting_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeDiffuseLighting_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeDisplacementMap_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeDisplacementMap_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeDisplacementMap_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeDropShadow_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeDropShadow_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeDropShadow_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeGaussianBlur_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeGaussianBlur_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeGaussianBlur_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeMergeNode_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeMergeNode_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeMergeNode_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeMorphology_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeMorphology_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeMorphology_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeOffset_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeOffset_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeOffset_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeSpecularLighting_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeSpecularLighting_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeSpecularLighting_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr FeTile_ In (NonEmpty.NonEmpty Event.Event  String ) where
  attr In bothValues = unsafeAttribute $ Both
    { key: "in", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in", value: prop' value })
instance Attr FeTile_ In  String  where
  attr In value = unsafeAttribute $ This $ pure $ { key: "in", value: prop' value }
instance Attr FeTile_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in", value: prop' value }

instance Attr everything In (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr In bothValues = unsafeAttribute $ Both { key: "in", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "in", value: unset' })
instance Attr everything In  Unit  where
  attr In _ = unsafeAttribute $ This $ pure $ { key: "in", value: unset' }
instance Attr everything In (Event.Event  Unit ) where
  attr In eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "in", value: unset' }
