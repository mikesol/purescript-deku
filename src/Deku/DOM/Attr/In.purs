module Deku.DOM.Attr.In where
import Prelude
import FRP.Event as Event
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
instance Attr FeBlend_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeBlend_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeBlend_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeColorMatrix_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeComponentTransfer_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeComposite_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeComposite_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeComposite_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeConvolveMatrix_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeDiffuseLighting_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeDisplacementMap_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeDropShadow_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeDropShadow_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeDropShadow_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeGaussianBlur_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeMergeNode_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeMergeNode_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeMergeNode_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeMorphology_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeMorphology_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeMorphology_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeOffset_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeOffset_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeOffset_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeSpecularLighting_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr FeTile_ In  String  where
  attr In value = unsafeAttribute (  { key: "in", value: prop' value  } <$ _)
instance Attr FeTile_ In (Event.Event Unit -> Event.Event  String ) where
  attr In eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in", value: prop' value })) eventValue)
instance Attr FeTile_ In (Event.Event  String ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in", value: prop' value }
instance Attr everything In  Unit  where
  attr In _ = unsafeAttribute (  { key: "in", value: unset'  } <$ _)
instance Attr everything In (Event.Event Unit -> Event.Event  Unit ) where
  attr In eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "in", value: unset' })) eventValue)
instance Attr everything In (Event.Event  Unit ) where
  attr In eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "in", value: unset' }