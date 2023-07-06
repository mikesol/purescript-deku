module Deku.DOM.Attr.OnSelectstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSelectstart = OnSelectstart

instance Attr anything OnSelectstart Cb where
  attr OnSelectstart value = unsafeAttribute
    { key: "selectstart", value: cb' value }

instance Attr anything OnSelectstart (Effect Unit) where
  attr OnSelectstart value = unsafeAttribute
    { key: "selectstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectstart (Effect Boolean) where
  attr OnSelectstart value = unsafeAttribute
    { key: "selectstart", value: cb' (Cb (const value)) }

type OnSelectstartEffect =
  forall element
   . Attr element OnSelectstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelectstart Unit where
  attr OnSelectstart _ = unsafeAttribute
    { key: "selectstart", value: unset' }
