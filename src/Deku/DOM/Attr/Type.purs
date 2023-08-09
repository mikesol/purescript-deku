module Deku.DOM.Attr.Type where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Type = Type
instance Attr AnimateTransform_ Type  String  where
  attr Type value = unsafeAttribute (  
    { key: "type", value: prop' value  } <$ _)
instance Attr AnimateTransform_ Type (Event.Event Unit -> Event.Event  String ) where
  attr Type eventValue = unsafeAttribute (map (map ( \value ->
    { key: "type", value: prop' value })) eventValue)
instance Attr AnimateTransform_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "type", value: prop' value }
instance Attr FeColorMatrix_ Type  String  where
  attr Type value = unsafeAttribute (  
    { key: "type", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ Type (Event.Event Unit -> Event.Event  String ) where
  attr Type eventValue = unsafeAttribute (map (map ( \value ->
    { key: "type", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "type", value: prop' value }
instance Attr FeFuncA_ Type  String  where
  attr Type value = unsafeAttribute (  
    { key: "type", value: prop' value  } <$ _)
instance Attr FeFuncA_ Type (Event.Event Unit -> Event.Event  String ) where
  attr Type eventValue = unsafeAttribute (map (map ( \value ->
    { key: "type", value: prop' value })) eventValue)
instance Attr FeFuncA_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "type", value: prop' value }
instance Attr FeFuncB_ Type  String  where
  attr Type value = unsafeAttribute (  
    { key: "type", value: prop' value  } <$ _)
instance Attr FeFuncB_ Type (Event.Event Unit -> Event.Event  String ) where
  attr Type eventValue = unsafeAttribute (map (map ( \value ->
    { key: "type", value: prop' value })) eventValue)
instance Attr FeFuncB_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "type", value: prop' value }
instance Attr FeFuncG_ Type  String  where
  attr Type value = unsafeAttribute (  
    { key: "type", value: prop' value  } <$ _)
instance Attr FeFuncG_ Type (Event.Event Unit -> Event.Event  String ) where
  attr Type eventValue = unsafeAttribute (map (map ( \value ->
    { key: "type", value: prop' value })) eventValue)
instance Attr FeFuncG_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "type", value: prop' value }
instance Attr FeFuncR_ Type  String  where
  attr Type value = unsafeAttribute (  
    { key: "type", value: prop' value  } <$ _)
instance Attr FeFuncR_ Type (Event.Event Unit -> Event.Event  String ) where
  attr Type eventValue = unsafeAttribute (map (map ( \value ->
    { key: "type", value: prop' value })) eventValue)
instance Attr FeFuncR_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "type", value: prop' value }
instance Attr FeTurbulence_ Type  String  where
  attr Type value = unsafeAttribute (  
    { key: "type", value: prop' value  } <$ _)
instance Attr FeTurbulence_ Type (Event.Event Unit -> Event.Event  String ) where
  attr Type eventValue = unsafeAttribute (map (map ( \value ->
    { key: "type", value: prop' value })) eventValue)
instance Attr FeTurbulence_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "type", value: prop' value }
instance Attr everything Type  Unit  where
  attr Type _ = unsafeAttribute (  { key: "type", value: unset'  } <$ _)
instance Attr everything Type (Event.Event Unit -> Event.Event  Unit ) where
  attr Type eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "type", value: unset' })) eventValue)
instance Attr everything Type (Event.Event  Unit ) where
  attr Type eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "type", value: unset' }