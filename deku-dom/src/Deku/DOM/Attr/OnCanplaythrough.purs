module Deku.DOM.Attr.OnCanplaythrough where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnCanplaythrough = OnCanplaythrough

instance Deku.Attribute.Attr everything OnCanplaythrough Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "oncanplaythrough", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnCanplaythrough
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "oncanplaythrough", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnCanplaythroughEffect =
  forall element
   . Deku.Attribute.Attr element OnCanplaythrough (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnCanplaythrough Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "oncanplaythrough", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnCanplaythrough (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "oncanplaythrough", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
