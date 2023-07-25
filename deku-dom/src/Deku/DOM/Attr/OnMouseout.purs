module Deku.DOM.Attr.OnMouseout where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnMouseout = OnMouseout

instance Deku.Attribute.Attr everything OnMouseout Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onmouseout", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnMouseout
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmouseout", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnMouseoutEffect =
  forall element
   . Deku.Attribute.Attr element OnMouseout (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnMouseout Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmouseout", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnMouseout (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmouseout", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
