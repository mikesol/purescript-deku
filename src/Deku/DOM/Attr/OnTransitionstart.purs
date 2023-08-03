module Deku.DOM.Attr.OnTransitionstart where

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

data OnTransitionstart = OnTransitionstart

instance Attr anything OnTransitionstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionstart", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "transitionstart", value: cb' value })
instance Attr anything OnTransitionstart (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnTransitionstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "transitionstart", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "transitionstart", value: cb' value })
instance Attr anything OnTransitionstart  Cb  where
  attr OnTransitionstart value = unsafeAttribute $ This $ pure $
    { key: "transitionstart", value: cb' value }
instance Attr anything OnTransitionstart (Event.Event  Cb ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionstart", value: cb' value }

instance Attr anything OnTransitionstart (ST.ST Global.Global  Cb ) where
  attr OnTransitionstart stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "transitionstart", value: cb' value }

instance Attr anything OnTransitionstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionstart"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitionstart (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnTransitionstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "transitionstart"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "transitionstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitionstart  (Effect Unit)  where
  attr OnTransitionstart value = unsafeAttribute $ This $ pure $
    { key: "transitionstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionstart (Event.Event  (Effect Unit) ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitionstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionstart (ST.ST Global.Global  (Effect Unit) ) where
  attr OnTransitionstart stValue = unsafeAttribute $ This $ stValue
    <#> \value ->
      { key: "transitionstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionstart", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitionstart (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnTransitionstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "transitionstart", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "transitionstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitionstart  (Effect Boolean)  where
  attr OnTransitionstart value = unsafeAttribute $ This $ pure $
    { key: "transitionstart", value: cb' (Cb (const value)) }
instance Attr anything OnTransitionstart (Event.Event  (Effect Boolean) ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionstart", value: cb' (Cb (const value)) }

instance Attr anything OnTransitionstart (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnTransitionstart stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "transitionstart", value: cb' (Cb (const value)) }

instance Attr everything OnTransitionstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTransitionstart bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionstart", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "transitionstart", value: unset' })
instance Attr everything OnTransitionstart (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnTransitionstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "transitionstart", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "transitionstart", value: unset' })
instance Attr everything OnTransitionstart  Unit  where
  attr OnTransitionstart _ = unsafeAttribute $ This $ pure $
    { key: "transitionstart", value: unset' }
instance Attr everything OnTransitionstart (Event.Event  Unit ) where
  attr OnTransitionstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitionstart", value: unset' }

instance Attr everything OnTransitionstart (ST.ST Global.Global  Unit ) where
  attr OnTransitionstart stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "transitionstart", value: unset' }
