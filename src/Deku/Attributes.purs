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

import Data.NonEmpty (NonEmpty, (:|))
import Deku.Attribute (class Attr, Attribute, attr, pureAttr, unpureAttr)
import Deku.DOM as D
import FRP.Event (Event)

spicyCurry :: forall f a t. (NonEmpty f a -> t) -> a -> f a -> t
spicyCurry x y z = x (y :| z)

-- | Set the `class` attribute of an element using an event emitting strings.
-- | Each `class` string emitted replaces the previous class string.
klass
  :: forall e u
   . Attr e D.Class u
  => Event u
  -> Attribute e
klass = unpureAttr D.Class

-- | Set the `class` attribute of an element using a string.
klass_ :: forall e u. Attr e D.Class u => u -> Attribute e
klass_ = pureAttr D.Class

-- | Set the `class` attribute of an element using a string and an event.
-- | The string is used as an initial value and the event is used to update the value.
klass' :: forall e u. Attr e D.Class u => u -> Event u -> Attribute e
klass' = spicyCurry (attr D.Class)


-- | Set the `id` attribute of an element using an event emitting strings.
-- | Each `id` string emitted replaces the previous id string.
id
  :: forall e u
   . Attr e D.Id u
  => Event u
  -> Attribute e
id = unpureAttr D.Id

-- | Set the `id` attribute of an element using a string.
id_ :: forall e u. Attr e D.Id u => u -> Attribute e
id_ = pureAttr D.Id

-- | Set the `id` attribute of an element using a string and an event.
-- | The string is used as an initial value and the event is used to update the value.
id' :: forall e u. Attr e D.Id u => u -> Event u -> Attribute e
id' = spicyCurry (attr D.Id)


-- | Set the `style` attribute of an element using an event emitting strings.
-- | Each `style` string emitted replaces the previous style string.
style
  :: forall e u
   . Attr e D.Style u
  => Event u
  -> Attribute e
style = unpureAttr D.Style

-- | Set the `style` attribute of an element using a string.
style_ :: forall e u. Attr e D.Style u => u -> Attribute e
style_ = pureAttr D.Style

-- | Set the `style` attribute of an element using a string and an event.
-- | The string is used as an initial value and the event is used to update the value.
style' :: forall e u. Attr e D.Style u => u -> Event u -> Attribute e
style' = spicyCurry (attr D.Style)


-- | Set the `href` attribute of an element using an event emitting strings.
-- | Each `href` string emitted replaces the previous href string.
href
  :: forall e u
   . Attr e D.Href u
  => Event u
  -> Attribute e
href = unpureAttr D.Href

-- | Set the `href` attribute of an element using a string.
href_ :: forall e u. Attr e D.Href u => u -> Attribute e
href_ = pureAttr D.Href

-- | Set the `href` attribute of an element using a string and an event.
-- | The string is used as an initial value and the event is used to update the value.
href' :: forall e u. Attr e D.Href u => u -> Event u -> Attribute e
href' = spicyCurry (attr D.Href)
