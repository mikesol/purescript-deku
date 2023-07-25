module Deku.DOM.Attr.OnDragend where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnDragend = OnDragend

instance Deku.Attribute.Attr everything OnDragend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ondragend", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnDragend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnDragendEffect =
  forall element
   . Deku.Attribute.Attr element OnDragend (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnDragend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragend", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnDragend (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
