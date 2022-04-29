module Main where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.Reader (ask, asks)
import Data.Compactable (compact)
import Data.Distributive (distribute)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Deku.Attribute (attr, (:=))
import Deku.Control (plant, switcher, text, text_)
import Deku.Core (Domable, Element)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import Effect.Random as Random
import FRP.Event (Event, bang, bus)
import FRP.Event.Class (biSampleOn)
import FRP.Event.VBus (V, vbus)
import Record (union)
import Type.Proxy (Proxy(..))

-- in a normal application, tokenState and getToken would be
-- provided by a third-party framework like auth0
tokenState :: Effect TokenState
tokenState = do
  rn <- Random.random
  let
    o
      | rn < 0.5 = pure Valid
      | rn < 0.75 = map Refreshed Random.random
      | otherwise = pure Invalid
  o

getToken :: Effect Number
getToken = Random.random

data TokenState = Valid | Refreshed Number | Invalid

topMatter :: forall l p. Element l p
topMatter = D.div_
  [ D.p_
      [ text_
          "In the example below, when you click on the buttons needing a token, one of three things will happen. It will either:"
      ]
  , D.ul_
      ( map (D.li_ <<< text_)
          [ "keep the same token;", "get a new token; or", "log you out." ]
      )
  , D.p_
      [ text_
          "This is how real-world apps work: based on user interaction, you periodically need to get a refresh token and, if the token is not valid, log the person out."
      ]
  ]

cell0 :: forall l p. _ -> Element l p
cell0 = pure (D.td_ $ text_ "I'm just a cell...")

cell1 :: forall l p. { myBool :: Boolean | _ } -> Element l p
cell1 = do
  { myBool } <- ask
  pure $ D.td_ $ text_
    ("Here's a boolean from an internal provider: " <> show myBool)

cell2 :: forall l p. { token1 :: Event Number | _ } -> Element l p
cell2 = do
  t1 <- asks _.token1
  pure (D.td_ $ text (("Token 1: " <> _) <<< show <$> t1))

cell3 :: forall l p. { push1 :: Effect Unit | _ } -> Element l p
cell3 = do
  { push1 } <- ask
  pure
    ( D.td_ $ D.button (bang (D.OnClick := push1))
        (text_ "Do something needing token 1")
    )

cell4 :: forall l p. { token2 :: Event Number | _ } -> Element l p
cell4 = do
  t2 <- asks _.token2
  pure (D.td_ $ text (("Token 2: " <> _) <<< show <$> t2))

cell5 :: forall l p. Effect Unit -> Element l p
cell5 = do
  push2 <- ask
  pure
    ( D.td_ $ D.button (bang (D.OnClick := push2))
        (text_ "Do something needing token 2")
    )

incrementToken
  :: forall l p. Event ({ token1 :: Event Number | _ } -> Domable l p)
incrementToken = bus \setN n -> do
  t1 <- asks _.token1
  let t1n = t1 <|> n
  pure $ plant $ D.div_
    [ D.p_ $ text_ "Increment token 1 locally, leaving it unchanged elsewhere."
    , D.button (map (attr D.OnClick <<< setN <<< add 1.0) t1n) (text_ "Increment")
    , D.p_ [ text_ "Token: ", text (map show t1n) ]
    ]

authorized :: forall l p. _ -> Element l p
authorized = do
  c0 <- cell0
  c1 <- lcmap (union { myBool: true }) cell1
  c2 <- cell2
  c3 <- cell3
  c4 <- cell4
  c5 <- lcmap _.push2 cell5
  incTok <- distribute incrementToken
  pure $ D.div_
    [ topMatter
    , D.table_
        [ D.tr_
            [ D.th_ (text_ "Column 1")
            , D.th_ (text_ "Column 2")
            ]
        , D.tr_ [ c0, c1 ]
        , D.tr_ [ c2, c3 ]
        , D.tr_ [ c4, c5 ]
        ]
    , D.div_ incTok
    ]

unauthorized
  :: forall l p
   . { token1 :: Number -> Effect Unit
     , token2 :: Number -> Effect Unit
     | _
     }
  -> Element l p
unauthorized = do
  { token1, token2 } <- ask
  pure $ D.button
    ( bang $ D.OnClick := do
        getToken >>= token1
        getToken >>= token2
    )
    (text_ "Log in")

type Tokens = V (token1 :: Maybe Number, token2 :: Maybe Number)

keepRefreshOrInvalidate
  :: (Maybe Number -> Effect Unit) -> Effect Unit
keepRefreshOrInvalidate push = do
  tk <- tokenState
  case tk of
    Valid -> mempty
    Refreshed i -> push $ Just i
    Invalid -> push Nothing

main :: Effect Unit
main = runInBody1
  ( vbus (Proxy :: _ Tokens) \push event -> do
      let
        tokens = biSampleOn (bang Nothing <|> event.token2)
          ({ token1: _, token2: _ } <$> (bang Nothing <|> event.token1))
      tokens # switcher \{ token1: t1, token2: t2 } -> case t1, t2 of
        Just t1', Just t2' -> do
          let token1 = compact event.token1 <|> bang t1'
          let token2 = compact event.token2 <|> bang t2'
          let push1 = keepRefreshOrInvalidate push.token1
          let push2 = keepRefreshOrInvalidate push.token2
          authorized { token1, token2, push1, push2 }
        _, _ -> unauthorized
          { token1: lcmap Just push.token1, token2: lcmap Just push.token2 }
  )
