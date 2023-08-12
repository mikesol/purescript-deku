module Deku.DOM.Attr.OnSelectionchange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSelectionchange = OnSelectionchange

instance Attr anything OnSelectionchange Cb where
  attr OnSelectionchange value = unsafeAttribute
    { key: "selectionchange", value: cb' value }

instance Attr anything OnSelectionchange (Effect Unit) where
  attr OnSelectionchange value = unsafeAttribute
    { key: "selectionchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectionchange (Effect Boolean) where
  attr OnSelectionchange value = unsafeAttribute
    { key: "selectionchange", value: cb' (Cb (const value)) }

type OnSelectionchangeEffect =
  forall element
   . Attr element OnSelectionchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelectionchange Unit where
  attr OnSelectionchange _ = unsafeAttribute
    { key: "selectionchange", value: unset' }
