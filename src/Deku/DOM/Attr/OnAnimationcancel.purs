module Deku.DOM.Attr.OnAnimationcancel where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnAnimationcancel = OnAnimationcancel

instance Attr anything OnAnimationcancel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both (pure 
    { key: "animationcancel", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "animationcancel", value: cb' value })
instance Attr anything OnAnimationcancel (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnAnimationcancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "animationcancel", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "animationcancel", value: cb' value })
instance Attr anything OnAnimationcancel  Cb  where
  attr OnAnimationcancel value = unsafeAttribute $ This $ pure $
    { key: "animationcancel", value: cb' value }
instance Attr anything OnAnimationcancel (Event.Event  Cb ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationcancel", value: cb' value }

instance Attr anything OnAnimationcancel (ST.ST Global.Global  Cb ) where
  attr OnAnimationcancel iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "animationcancel", value: cb' value }

instance Attr anything OnAnimationcancel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both (pure 
    { key: "animationcancel"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationcancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationcancel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnAnimationcancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "animationcancel"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "animationcancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationcancel  (Effect Unit)  where
  attr OnAnimationcancel value = unsafeAttribute $ This $ pure $
    { key: "animationcancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationcancel (Event.Event  (Effect Unit) ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "animationcancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationcancel (ST.ST Global.Global  (Effect Unit) ) where
  attr OnAnimationcancel iValue = unsafeAttribute $ This $ iValue
    <#> \value ->
      { key: "animationcancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationcancel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both (pure 
    { key: "animationcancel", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationcancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationcancel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnAnimationcancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "animationcancel", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "animationcancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationcancel  (Effect Boolean)  where
  attr OnAnimationcancel value = unsafeAttribute $ This $ pure $
    { key: "animationcancel", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationcancel (Event.Event  (Effect Boolean) ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationcancel", value: cb' (Cb (const value)) }

instance Attr anything OnAnimationcancel (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnAnimationcancel iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "animationcancel", value: cb' (Cb (const value)) }

instance Attr everything OnAnimationcancel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAnimationcancel bothValues = unsafeAttribute $ Both (pure 
    { key: "animationcancel", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "animationcancel", value: unset' })
instance Attr everything OnAnimationcancel (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnAnimationcancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "animationcancel", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "animationcancel", value: unset' })
instance Attr everything OnAnimationcancel  Unit  where
  attr OnAnimationcancel _ = unsafeAttribute $ This $ pure $
    { key: "animationcancel", value: unset' }
instance Attr everything OnAnimationcancel (Event.Event  Unit ) where
  attr OnAnimationcancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "animationcancel", value: unset' }

instance Attr everything OnAnimationcancel (ST.ST Global.Global  Unit ) where
  attr OnAnimationcancel iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "animationcancel", value: unset' }
