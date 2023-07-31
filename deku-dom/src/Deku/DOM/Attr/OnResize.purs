module Deku.DOM.Attr.OnResize where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnResize = OnResize

instance Deku.Attribute.Attr everything OnResize Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "resize", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnResize
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "resize", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnResizeEffect =
  forall element
   . Deku.Attribute.Attr element OnResize (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnResize Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "resize", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnResize (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "resize", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
