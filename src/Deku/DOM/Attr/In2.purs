module Deku.DOM.Attr.In2 where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data In2 = In2
instance Attr FeBlend_ In2  String  where
  attr In2 value = unsafeAttribute (  { key: "in2", value: prop' value  } <$ _)
instance Attr FeBlend_ In2 (Event.Event Unit -> Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in2", value: prop' value })) eventValue)
instance Attr FeBlend_ In2 (Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in2", value: prop' value }
instance Attr FeComposite_ In2  String  where
  attr In2 value = unsafeAttribute (  { key: "in2", value: prop' value  } <$ _)
instance Attr FeComposite_ In2 (Event.Event Unit -> Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in2", value: prop' value })) eventValue)
instance Attr FeComposite_ In2 (Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in2", value: prop' value }
instance Attr FeDisplacementMap_ In2  String  where
  attr In2 value = unsafeAttribute (  { key: "in2", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ In2 (Event.Event Unit -> Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute (map (map ( \value ->
    { key: "in2", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ In2 (Event.Event  String ) where
  attr In2 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "in2", value: prop' value }
instance Attr everything In2  Unit  where
  attr In2 _ = unsafeAttribute (  { key: "in2", value: unset'  } <$ _)
instance Attr everything In2 (Event.Event Unit -> Event.Event  Unit ) where
  attr In2 eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "in2", value: unset' })) eventValue)
instance Attr everything In2 (Event.Event  Unit ) where
  attr In2 eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "in2", value: unset' }