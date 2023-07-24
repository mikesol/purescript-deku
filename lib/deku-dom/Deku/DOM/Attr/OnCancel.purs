module Deku.DOM.Attr.OnCancel where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnCancel = OnCancel

instance Deku.Attribute.Attr everything OnCancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onCancel", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnCancel
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onCancel", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnCancelEffect =
  forall element
   . Deku.Attribute.Attr element OnCancel (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnCancel Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onCancel", value: _ } <<< Deku.Attribute.cb'
