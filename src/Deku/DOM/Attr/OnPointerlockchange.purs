module Deku.DOM.Attr.OnPointerlockchange where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerlockchange = OnPointerlockchange

instance Attr anything OnPointerlockchange Cb where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both
    { key: "pointerlockchange", value: cb' (fst bothValues) }
    ( snd bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' value }
    )
  pureAttr OnPointerlockchange value = unsafeAttribute $ This
    { key: "pointerlockchange", value: cb' value }
  unpureAttr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "pointerlockchange", value: cb' value }

instance Attr anything OnPointerlockchange (Effect Unit) where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both
    { key: "pointerlockchange"
    , value: cb' (Cb (const ((fst bothValues) $> true)))
    }
    ( snd bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPointerlockchange value = unsafeAttribute $ This
    { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerlockchange (Effect Boolean) where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both
    { key: "pointerlockchange", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' (Cb (const value)) }
    )
  pureAttr OnPointerlockchange value = unsafeAttribute $ This
    { key: "pointerlockchange", value: cb' (Cb (const value)) }
  unpureAttr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const value)) }

type OnPointerlockchangeEffect =
  forall element
   . Attr element OnPointerlockchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerlockchange Unit where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both
    { key: "pointerlockchange", value: unset' }
    (snd bothValues <#> \_ -> { key: "pointerlockchange", value: unset' })
  pureAttr OnPointerlockchange _ = unsafeAttribute $ This
    { key: "pointerlockchange", value: unset' }
  unpureAttr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "pointerlockchange", value: unset' }
