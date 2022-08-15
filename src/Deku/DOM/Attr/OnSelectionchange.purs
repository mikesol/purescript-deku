module Deku.DOM.Attr.OnSelectionchange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnSelectionchange = OnSelectionchange
instance Attr anything OnSelectionchange Cb where
  attr OnSelectionchange value = unsafeAttribute { key: "selectionchange", value: cb' value }
instance Attr anything OnSelectionchange (Effect Unit) where
  attr OnSelectionchange value = unsafeAttribute { key: "selectionchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelectionchange (Effect Boolean) where
  attr OnSelectionchange value = unsafeAttribute { key: "selectionchange", value: cb' (Cb (const value)) }
instance Attr anything OnSelectionchange (Zora Unit) where
  attr OnSelectionchange value = unsafeAttribute { key: "selectionchange", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnSelectionchange (Zora Boolean) where
  attr OnSelectionchange value = unsafeAttribute { key: "selectionchange", value: cb' (Cb (const (runImpure value))) }