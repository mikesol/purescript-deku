module Deku.DOM.Attr.OnPause where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnPause = OnPause

instance Deku.Attribute.Attr everything OnPause Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onPause", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPause
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onPause", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPauseEffect =
  forall element
   . Deku.Attribute.Attr element OnPause (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPause Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onPause", value: _ } <<< Deku.Attribute.cb'
