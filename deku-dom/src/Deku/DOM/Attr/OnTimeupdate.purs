module Deku.DOM.Attr.OnTimeupdate where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnTimeupdate = OnTimeupdate

instance Deku.Attribute.Attr everything OnTimeupdate Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "timeupdate", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTimeupdate
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "timeupdate", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTimeupdateEffect =
  forall element
   . Deku.Attribute.Attr element OnTimeupdate (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTimeupdate Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "timeupdate", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnTimeupdate (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "timeupdate", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
