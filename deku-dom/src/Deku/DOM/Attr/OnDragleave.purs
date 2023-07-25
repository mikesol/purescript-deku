module Deku.DOM.Attr.OnDragleave where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnDragleave = OnDragleave

instance Deku.Attribute.Attr everything OnDragleave Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ondragleave", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnDragleave
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragleave", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnDragleaveEffect =
  forall element
   . Deku.Attribute.Attr element OnDragleave (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnDragleave Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragleave", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnDragleave (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragleave", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
