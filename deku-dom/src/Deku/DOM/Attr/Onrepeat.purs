module Deku.DOM.Attr.OnRepeat where

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

data OnRepeat = OnRepeat

instance Deku.Attribute.Attr everything OnRepeat Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onrepeat", value: Deku.Attribute.unset' }

type OnRepeatEffect =
  forall element
   . Deku.Attribute.Attr element OnRepeat (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance
  Deku.Attribute.Attr Animate_
    OnRepeat
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Animate_ OnRepeat Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr Animate_ OnRepeat (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr AnimateMotion_
    OnRepeat
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateMotion_ OnRepeat Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr AnimateMotion_ OnRepeat (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr AnimateTransform_
    OnRepeat
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateTransform_ OnRepeat Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr AnimateTransform_ OnRepeat (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr Discard_
    OnRepeat
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Discard_ OnRepeat Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr Discard_ OnRepeat (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const

instance
  Deku.Attribute.Attr Set_ OnRepeat (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Set_ OnRepeat Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr Set_ OnRepeat (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
