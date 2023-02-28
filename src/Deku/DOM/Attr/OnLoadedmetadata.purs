module Deku.DOM.Attr.OnLoadedmetadata where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoadedmetadata = OnLoadedmetadata

instance Attr anything OnLoadedmetadata Cb where
  attr OnLoadedmetadata value = unsafeAttribute
    { key: "loadedmetadata", value: cb' value }

instance Attr anything OnLoadedmetadata (Effect Unit) where
  attr OnLoadedmetadata value = unsafeAttribute
    { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadedmetadata (Effect Boolean) where
  attr OnLoadedmetadata value = unsafeAttribute
    { key: "loadedmetadata", value: cb' (Cb (const value)) }

type OnLoadedmetadataEffect =
  forall element
   . Attr element OnLoadedmetadata (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadedmetadata Unit where
  attr OnLoadedmetadata _ = unsafeAttribute
    { key: "loadedmetadata", value: unset' }
