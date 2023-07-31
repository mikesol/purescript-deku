-- | This module contains various helper functions for setting attributes on elements.
module Deku.Attributes
  ( href
  , href_
  , href'
  , id
  , id_
  , id'
  , klass
  , klass_
  , klass'
  , style
  , style_
  , style'
  ) where


import Data.Tuple (curry)
import Deku.Attribute (class Attr, Attribute, attr, pureAttr, unpureAttr)
import Deku.DOM as D
import FRP.Event (Event)

-- | Set the `class` attribute of an element using an event emitting strings.
-- | Each `class` string emitted replaces the previous class string.
klass
  :: forall e
   . Attr e D.Class String
  => Event String
  -> Attribute e
klass = unpureAttr D.Class

-- | Set the `class` attribute of an element using a string.
klass_ :: forall e. Attr e D.Class String => String -> Attribute e
klass_ = pureAttr D.Class

-- | Set the `class` attribute of an element using a string and an event.
-- | The string is used as an initial value and the event is used to update the value.
klass' :: forall e. Attr e D.Class String => String -> Event String -> Attribute e
klass' = curry (attr D.Class)


-- | Set the `id` attribute of an element using an event emitting strings.
-- | Each `id` string emitted replaces the previous id string.
id
  :: forall e
   . Attr e D.Id String
  => Event String
  -> Attribute e
id = unpureAttr D.Id

-- | Set the `id` attribute of an element using a string.
id_ :: forall e. Attr e D.Id String => String -> Attribute e
id_ = pureAttr D.Id

-- | Set the `id` attribute of an element using a string and an event.
-- | The string is used as an initial value and the event is used to update the value.
id' :: forall e. Attr e D.Id String => String -> Event String -> Attribute e
id' = curry (attr D.Id)


-- | Set the `style` attribute of an element using an event emitting strings.
-- | Each `style` string emitted replaces the previous style string.
style
  :: forall e
   . Attr e D.Style String
  => Event String
  -> Attribute e
style = unpureAttr D.Style

-- | Set the `style` attribute of an element using a string.
style_ :: forall e. Attr e D.Style String => String -> Attribute e
style_ = pureAttr D.Style

-- | Set the `style` attribute of an element using a string and an event.
-- | The string is used as an initial value and the event is used to update the value.
style' :: forall e. Attr e D.Style String => String -> Event String -> Attribute e
style' = curry (attr D.Style)


-- | Set the `href` attribute of an element using an event emitting strings.
-- | Each `href` string emitted replaces the previous href string.
href
  :: forall e
   . Attr e D.Href String
  => Event String
  -> Attribute e
href = unpureAttr D.Href

-- | Set the `href` attribute of an element using a string.
href_ :: forall e. Attr e D.Href String => String -> Attribute e
href_ = pureAttr D.Href

-- | Set the `href` attribute of an element using a string and an event.
-- | The string is used as an initial value and the event is used to update the value.
href' :: forall e. Attr e D.Href String => String -> Event String -> Attribute e
href' = curry (attr D.Href)
