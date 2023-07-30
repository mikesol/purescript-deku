module Deku.DOM.Attr.OnEnded where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnEnded = OnEnded

instance Attr anything OnEnded Cb where
  attr OnEnded bothValues = unsafeAttribute $ Both
    { key: "ended", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "ended", value: cb' value })
  pureAttr OnEnded value = unsafeAttribute $ This
    { key: "ended", value: cb' value }
  unpureAttr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ended", value: cb' value }

instance Attr anything OnEnded (Effect Unit) where
  attr OnEnded bothValues = unsafeAttribute $ Both
    { key: "ended", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "ended", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnEnded value = unsafeAttribute $ This
    { key: "ended", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ended", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEnded (Effect Boolean) where
  attr OnEnded bothValues = unsafeAttribute $ Both
    { key: "ended", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "ended", value: cb' (Cb (const value)) }
    )
  pureAttr OnEnded value = unsafeAttribute $ This
    { key: "ended", value: cb' (Cb (const value)) }
  unpureAttr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ended", value: cb' (Cb (const value)) }

type OnEndedEffect =
  forall element
   . Attr element OnEnded (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnEnded Unit where
  attr OnEnded bothValues = unsafeAttribute $ Both
    { key: "ended", value: unset' }
    (snd bothValues <#> \_ -> { key: "ended", value: unset' })
  pureAttr OnEnded _ = unsafeAttribute $ This { key: "ended", value: unset' }
  unpureAttr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "ended", value: unset' }
