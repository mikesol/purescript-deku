module Deku.DOM.Attr.OnReset where

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

data OnReset = OnReset

instance Attr anything OnReset (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnReset bothValues = unsafeAttribute $ Both (pure 
    { key: "reset", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "reset", value: cb' value })
instance Attr anything OnReset (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnReset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "reset", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "reset", value: cb' value })
instance Attr anything OnReset  Cb  where
  attr OnReset value = unsafeAttribute $ This $ pure $
    { key: "reset", value: cb' value }
instance Attr anything OnReset (Event.Event  Cb ) where
  attr OnReset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "reset", value: cb' value }

instance Attr anything OnReset (ST.ST Global.Global  Cb ) where
  attr OnReset iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "reset", value: cb' value }

instance Attr anything OnReset (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnReset bothValues = unsafeAttribute $ Both (pure 
    { key: "reset", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "reset", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnReset (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnReset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "reset", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "reset", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnReset  (Effect Unit)  where
  attr OnReset value = unsafeAttribute $ This $ pure $
    { key: "reset", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnReset (Event.Event  (Effect Unit) ) where
  attr OnReset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "reset", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnReset (ST.ST Global.Global  (Effect Unit) ) where
  attr OnReset iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "reset", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnReset (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnReset bothValues = unsafeAttribute $ Both (pure 
    { key: "reset", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "reset", value: cb' (Cb (const value)) }
    )
instance Attr anything OnReset (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnReset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "reset", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "reset", value: cb' (Cb (const value)) }
    )
instance Attr anything OnReset  (Effect Boolean)  where
  attr OnReset value = unsafeAttribute $ This $ pure $
    { key: "reset", value: cb' (Cb (const value)) }
instance Attr anything OnReset (Event.Event  (Effect Boolean) ) where
  attr OnReset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "reset", value: cb' (Cb (const value)) }

instance Attr anything OnReset (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnReset iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "reset", value: cb' (Cb (const value)) }

instance Attr everything OnReset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnReset bothValues = unsafeAttribute $ Both (pure 
    { key: "reset", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "reset", value: unset' })
instance Attr everything OnReset (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnReset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "reset", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "reset", value: unset' })
instance Attr everything OnReset  Unit  where
  attr OnReset _ = unsafeAttribute $ This $ { key: "reset", value: unset' }
instance Attr everything OnReset (Event.Event  Unit ) where
  attr OnReset eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "reset", value: unset' }

instance Attr everything OnReset (ST.ST Global.Global  Unit ) where
  attr OnReset iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "reset", value: unset' }
