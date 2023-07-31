module Deku.DOM.Attr.OnCanplay where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnCanplay = OnCanplay

instance Deku.Attribute.Attr everything OnCanplay Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "canplay", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnCanplay
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "canplay", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnCanplayEffect =
  forall element
   . Deku.Attribute.Attr element OnCanplay (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnCanplay Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "canplay", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnCanplay (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "canplay", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
