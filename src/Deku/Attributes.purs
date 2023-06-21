-- | This module contains various helper functions for setting attributes on elements.
module Deku.Attributes
  ( href
  , href_
  , id
  , id_
  , klass
  , klass_
  , style
  , style_
  ) where

import Prelude

import Deku.Attribute (class Attr, Attribute, (<:=>))
import Deku.DOM as D
import FRP.Event (Event)

-- | Set the `class` attribute of an element using an event emitting strings.
-- | Each `class` string emitted replaces the previous class string.
klass
  :: forall e
   . Attr e D.Class String
  => Event String
  -> Attribute e
klass e = D.Class <:=> e

-- | Set the `class` attribute of an element using a string.
-- | This is a pure event, meaning that it sets the class string immediately upon being
-- | fired.
klass_ :: forall e. Attr e D.Class String => String -> Attribute e
klass_ = klass <<< pure

-- | Set the `style` attribute of an element using an event emitting strings.
-- | Each `style` string emitted replaces the previous style string.
style
  :: forall e
   . Attr e D.Style String
  => Event String
  -> Attribute e
style e = D.Style <:=> e

-- | Set the `style` attribute of an element using a string.
-- | This is a pure event, meaning that it sets the style string immediately upon being
-- | fired.
style_ :: forall e. Attr e D.Style String => String -> Attribute e
style_ = style <<< pure

-- | Set the `id` attribute of an element using an event emitting strings.
-- | Each `id` string emitted replaces the previous id string.
id
  :: forall e
   . Attr e D.Id String
  => Event String
  -> Attribute e
id e = D.Id <:=> e

-- | Set the `id` attribute of an element using a string.
-- | This is a pure event, meaning that it sets the id string immediately upon being
-- | fired.
id_ :: forall e. Attr e D.Id String => String -> Attribute e
id_ = id <<< pure

-- | Set the `href` attribute of an element using an event emitting strings.
-- | Each `href` string emitted replaces the previous href string.
href
  :: forall e
   . Attr e D.Href String
  => Event String
  -> Attribute e
href e = D.Href <:=> e

-- | Set the `href` attribute of an element using a string.
-- | This is a pure event, meaning that it sets the href string immediately upon being
-- | fired.
href_ :: forall e. Attr e D.Href String => String -> Attribute e
href_ = href <<< pure