module Deku.DOM.Attr.OnTransitioncancel where

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

data OnTransitioncancel = OnTransitioncancel

instance Attr anything OnTransitioncancel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both (pure 
    { key: "transitioncancel", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "transitioncancel", value: cb' value })
instance Attr anything OnTransitioncancel (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnTransitioncancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "transitioncancel", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "transitioncancel", value: cb' value })
instance Attr anything OnTransitioncancel  Cb  where
  attr OnTransitioncancel value = unsafeAttribute $ This $ pure $
    { key: "transitioncancel", value: cb' value }
instance Attr anything OnTransitioncancel (Event.Event  Cb ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitioncancel", value: cb' value }

instance Attr anything OnTransitioncancel (ST.ST Global.Global  Cb ) where
  attr OnTransitioncancel stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "transitioncancel", value: cb' value }

instance Attr anything OnTransitioncancel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both (pure 
    { key: "transitioncancel"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitioncancel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnTransitioncancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "transitioncancel"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitioncancel  (Effect Unit)  where
  attr OnTransitioncancel value = unsafeAttribute $ This $ pure $
    { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitioncancel (Event.Event  (Effect Unit) ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitioncancel (ST.ST Global.Global  (Effect Unit) ) where
  attr OnTransitioncancel stValue = unsafeAttribute $ This $ stValue
    <#> \value ->
      { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitioncancel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both (pure 
    { key: "transitioncancel", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitioncancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitioncancel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnTransitioncancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "transitioncancel", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "transitioncancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitioncancel  (Effect Boolean)  where
  attr OnTransitioncancel value = unsafeAttribute $ This $ pure $
    { key: "transitioncancel", value: cb' (Cb (const value)) }
instance Attr anything OnTransitioncancel (Event.Event  (Effect Boolean) ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitioncancel", value: cb' (Cb (const value)) }

instance Attr anything OnTransitioncancel (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnTransitioncancel stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "transitioncancel", value: cb' (Cb (const value)) }

instance Attr everything OnTransitioncancel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTransitioncancel bothValues = unsafeAttribute $ Both (pure 
    { key: "transitioncancel", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "transitioncancel", value: unset' })
instance Attr everything OnTransitioncancel (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnTransitioncancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "transitioncancel", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "transitioncancel", value: unset' })
instance Attr everything OnTransitioncancel  Unit  where
  attr OnTransitioncancel _ = unsafeAttribute $ This $ pure $
    { key: "transitioncancel", value: unset' }
instance Attr everything OnTransitioncancel (Event.Event  Unit ) where
  attr OnTransitioncancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitioncancel", value: unset' }

instance Attr everything OnTransitioncancel (ST.ST Global.Global  Unit ) where
  attr OnTransitioncancel stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "transitioncancel", value: unset' }
