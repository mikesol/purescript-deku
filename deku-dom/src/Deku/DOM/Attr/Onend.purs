module Deku.DOM.Attr.OnEnd where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.Set (Set_)
import FRP.Event as FRP.Event
import Data.Function (const)

data OnEnd = OnEnd

instance Deku.Attribute.Attr everything OnEnd Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onend", value: Deku.Attribute.unset' }

type OnEndEffect =
  forall element
   . Deku.Attribute.Attr element OnEnd (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance
  Deku.Attribute.Attr Animate_
    OnEnd
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

instance Deku.Attribute.Attr Animate_ OnEnd Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr Animate_ OnEnd (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr AnimateMotion_
    OnEnd
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateMotion_ OnEnd Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr AnimateMotion_ OnEnd (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr AnimateTransform_
    OnEnd
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateTransform_ OnEnd Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr AnimateTransform_ OnEnd (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr Discard_
    OnEnd
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

instance Deku.Attribute.Attr Discard_ OnEnd Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr Discard_ OnEnd (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr Set_ OnEnd (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

instance Deku.Attribute.Attr Set_ OnEnd Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr Set_ OnEnd (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
