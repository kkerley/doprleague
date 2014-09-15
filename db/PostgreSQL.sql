--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    trackable_id integer,
    trackable_type character varying(255),
    owner_id integer,
    owner_type character varying(255),
    key character varying(255),
    parameters text,
    recipient_id integer,
    recipient_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.activities OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: awards; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE awards (
    id integer NOT NULL,
    name text,
    amount integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    payout_id integer,
    notes character varying(255)
);


ALTER TABLE public.awards OWNER TO postgres;

--
-- Name: awards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE awards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.awards_id_seq OWNER TO postgres;

--
-- Name: awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE awards_id_seq OWNED BY awards.id;


--
-- Name: budgets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE budgets (
    id integer NOT NULL,
    team_id integer,
    year integer,
    amount integer DEFAULT 130,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.budgets OWNER TO postgres;

--
-- Name: budgets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE budgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.budgets_id_seq OWNER TO postgres;

--
-- Name: budgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE budgets_id_seq OWNED BY budgets.id;


--
-- Name: contracts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contracts (
    id integer NOT NULL,
    player_id integer,
    contract_start_year integer,
    contract_length integer,
    is_bought_out boolean,
    bought_out_by_team_id integer,
    is_extended boolean,
    is_franchised boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_dead_money boolean,
    is_drafted boolean,
    is_longterm_deal boolean
);


ALTER TABLE public.contracts OWNER TO postgres;

--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_id_seq OWNER TO postgres;

--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contracts_id_seq OWNED BY contracts.id;


--
-- Name: conversations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE conversations (
    id integer NOT NULL,
    subject character varying(255) DEFAULT ''::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.conversations OWNER TO postgres;

--
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversations_id_seq OWNER TO postgres;

--
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conversations_id_seq OWNED BY conversations.id;


--
-- Name: draft_rosters; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE draft_rosters (
    id integer NOT NULL,
    name character varying(255),
    team_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.draft_rosters OWNER TO postgres;

--
-- Name: draft_rosters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE draft_rosters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.draft_rosters_id_seq OWNER TO postgres;

--
-- Name: draft_rosters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE draft_rosters_id_seq OWNED BY draft_rosters.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    team_id integer,
    title character varying(255),
    event_date date,
    event_type character varying(255) DEFAULT 'Personal'::character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE features (
    id integer NOT NULL,
    title character varying(255),
    content text,
    homepage_order integer,
    on_homepage boolean,
    show_title boolean,
    feature_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_published boolean,
    url_path character varying(255),
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    excerpt text,
    image_classes character varying(255),
    highlighted_post boolean,
    subtitle character varying(255),
    category_one_on boolean,
    category_two_on boolean,
    category_three_on boolean,
    category_one_text character varying(255),
    category_two_text character varying(255),
    category_three_text character varying(255),
    category_one_class character varying(255),
    category_two_class character varying(255),
    category_three_class character varying(255),
    user_id integer DEFAULT 1
);


ALTER TABLE public.features OWNER TO postgres;

--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.features_id_seq OWNER TO postgres;

--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE features_id_seq OWNED BY features.id;


--
-- Name: nfl_teams; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nfl_teams (
    id integer NOT NULL,
    mascot character varying(255),
    conference character varying(255),
    city character varying(255),
    shorthand character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    bye_week integer
);


ALTER TABLE public.nfl_teams OWNER TO postgres;

--
-- Name: nfl_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nfl_teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nfl_teams_id_seq OWNER TO postgres;

--
-- Name: nfl_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nfl_teams_id_seq OWNED BY nfl_teams.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE notifications (
    id integer NOT NULL,
    type character varying(255),
    body text,
    subject character varying(255) DEFAULT ''::character varying,
    sender_id integer,
    sender_type character varying(255),
    conversation_id integer,
    draft boolean DEFAULT false,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    notified_object_id integer,
    notified_object_type character varying(255),
    notification_code character varying(255) DEFAULT NULL::character varying,
    attachment character varying(255),
    global boolean DEFAULT false,
    expires timestamp without time zone
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: payouts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE payouts (
    id integer NOT NULL,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.payouts OWNER TO postgres;

--
-- Name: payouts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payouts_id_seq OWNER TO postgres;

--
-- Name: payouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payouts_id_seq OWNED BY payouts.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE players (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    nfl_team character varying(255),
    "position" character varying(255),
    auction_value integer,
    bye_week character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_retired boolean DEFAULT false
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- Name: receipts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE receipts (
    id integer NOT NULL,
    receiver_id integer,
    receiver_type character varying(255),
    notification_id integer NOT NULL,
    is_read boolean DEFAULT false,
    trashed boolean DEFAULT false,
    deleted boolean DEFAULT false,
    mailbox_type character varying(25),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.receipts OWNER TO postgres;

--
-- Name: receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipts_id_seq OWNER TO postgres;

--
-- Name: receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE receipts_id_seq OWNED BY receipts.id;


--
-- Name: roster_spots; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roster_spots (
    id integer NOT NULL,
    draft_roster_id integer,
    player_id integer,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roster_spots OWNER TO postgres;

--
-- Name: roster_spots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roster_spots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roster_spots_id_seq OWNER TO postgres;

--
-- Name: roster_spots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roster_spots_id_seq OWNED BY roster_spots.id;


--
-- Name: salary_progressions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salary_progressions (
    id integer NOT NULL,
    auction_value integer,
    year2 integer,
    year3 integer,
    year4 integer,
    year5 integer,
    year6 integer,
    year7 integer,
    year8 integer,
    year9 integer,
    year10 integer,
    year11 integer,
    year12 integer,
    year13 integer,
    year14 integer,
    year15 integer,
    year16 integer,
    year17 integer,
    year18 integer,
    year19 integer,
    year20 integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.salary_progressions OWNER TO postgres;

--
-- Name: salary_progressions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salary_progressions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salary_progressions_id_seq OWNER TO postgres;

--
-- Name: salary_progressions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE salary_progressions_id_seq OWNED BY salary_progressions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: standings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE standings (
    id integer NOT NULL,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.standings OWNER TO postgres;

--
-- Name: standings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE standings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.standings_id_seq OWNER TO postgres;

--
-- Name: standings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE standings_id_seq OWNED BY standings.id;


--
-- Name: stipulations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stipulations (
    id integer NOT NULL,
    trade_id integer,
    year integer,
    stipulation_type character varying(255),
    terms character varying(255),
    description text,
    rest_of_contract boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    trade_direction character varying(255),
    player_id integer,
    trader1_budget_id integer,
    trader2_budget_id integer
);


ALTER TABLE public.stipulations OWNER TO postgres;

--
-- Name: stipulations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stipulations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stipulations_id_seq OWNER TO postgres;

--
-- Name: stipulations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stipulations_id_seq OWNED BY stipulations.id;


--
-- Name: subcontracts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subcontracts (
    id integer NOT NULL,
    team_id integer,
    contract_id integer,
    salary_amount integer,
    contract_year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    this_is_an_extension boolean,
    this_is_a_franchise_tag boolean,
    this_is_a_buyout boolean
);


ALTER TABLE public.subcontracts OWNER TO postgres;

--
-- Name: subcontracts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subcontracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subcontracts_id_seq OWNER TO postgres;

--
-- Name: subcontracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subcontracts_id_seq OWNED BY subcontracts.id;


--
-- Name: super_bowl_picks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE super_bowl_picks (
    id integer NOT NULL,
    team_id integer,
    super_bowl_id integer,
    nfl_team_id integer,
    combined_total integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.super_bowl_picks OWNER TO postgres;

--
-- Name: super_bowl_picks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE super_bowl_picks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_bowl_picks_id_seq OWNER TO postgres;

--
-- Name: super_bowl_picks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE super_bowl_picks_id_seq OWNED BY super_bowl_picks.id;


--
-- Name: super_bowls; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE super_bowls (
    id integer NOT NULL,
    nfl_team1_id integer,
    nfl_team2_id integer,
    tie_breaker boolean,
    nfl_team1_final_score integer,
    nfl_team2_final_score integer,
    nfl_winner_id integer,
    dopr_winner_id integer,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.super_bowls OWNER TO postgres;

--
-- Name: super_bowls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE super_bowls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_bowls_id_seq OWNER TO postgres;

--
-- Name: super_bowls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE super_bowls_id_seq OWNED BY super_bowls.id;


--
-- Name: team_records; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE team_records (
    id integer NOT NULL,
    team_id integer,
    standing_id integer,
    rank character varying(255),
    wlt character varying(255),
    pct double precision,
    division_record character varying(255),
    pts_for double precision,
    pts_against double precision,
    streak character varying(255),
    moves integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.team_records OWNER TO postgres;

--
-- Name: team_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE team_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_records_id_seq OWNER TO postgres;

--
-- Name: team_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE team_records_id_seq OWNED BY team_records.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE teams (
    id integer NOT NULL,
    team_name character varying(255),
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    division character varying(255)
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: trades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trades (
    id integer NOT NULL,
    trader1_id integer,
    trader2_id integer,
    trader1_accepted boolean,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    trader2_accepted boolean,
    is_rejected boolean DEFAULT false
);


ALTER TABLE public.trades OWNER TO postgres;

--
-- Name: trades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trades_id_seq OWNER TO postgres;

--
-- Name: trades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trades_id_seq OWNED BY trades.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    encrypted_password character varying(255),
    password_salt character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    remember_me_token character varying(255) DEFAULT NULL::character varying,
    remember_me_token_expires_at timestamp without time zone,
    is_admin boolean,
    display_name character varying(255),
    is_current boolean,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    role character varying(255) DEFAULT 'regular'::character varying,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY awards ALTER COLUMN id SET DEFAULT nextval('awards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY budgets ALTER COLUMN id SET DEFAULT nextval('budgets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contracts ALTER COLUMN id SET DEFAULT nextval('contracts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conversations ALTER COLUMN id SET DEFAULT nextval('conversations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY draft_rosters ALTER COLUMN id SET DEFAULT nextval('draft_rosters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY features ALTER COLUMN id SET DEFAULT nextval('features_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nfl_teams ALTER COLUMN id SET DEFAULT nextval('nfl_teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payouts ALTER COLUMN id SET DEFAULT nextval('payouts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY receipts ALTER COLUMN id SET DEFAULT nextval('receipts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roster_spots ALTER COLUMN id SET DEFAULT nextval('roster_spots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY salary_progressions ALTER COLUMN id SET DEFAULT nextval('salary_progressions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY standings ALTER COLUMN id SET DEFAULT nextval('standings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stipulations ALTER COLUMN id SET DEFAULT nextval('stipulations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subcontracts ALTER COLUMN id SET DEFAULT nextval('subcontracts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY super_bowl_picks ALTER COLUMN id SET DEFAULT nextval('super_bowl_picks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY super_bowls ALTER COLUMN id SET DEFAULT nextval('super_bowls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team_records ALTER COLUMN id SET DEFAULT nextval('team_records_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trades ALTER COLUMN id SET DEFAULT nextval('trades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY activities (id, trackable_id, trackable_type, owner_id, owner_type, key, parameters, recipient_id, recipient_type, created_at, updated_at) FROM stdin;
1	45	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-04-25 01:34:57.987118	2014-04-25 01:34:57.987118
2	45	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-04-25 01:36:15.640566	2014-04-25 01:36:15.640566
3	46	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-05-12 04:21:04.296318	2014-05-12 04:21:04.296318
4	20	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-05-25 05:53:07.572394	2014-05-25 05:53:07.572394
5	20	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-05-25 05:53:43.182739	2014-05-25 05:53:43.182739
6	29	NflTeam	1	User	nfl_team.import	--- {}\n\n	\N	\N	2014-05-28 05:03:11.676886	2014-05-28 05:03:11.676886
7	46	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-06-02 05:14:11.358634	2014-06-02 05:14:11.358634
8	47	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-24 02:48:00.210133	2014-06-24 02:48:00.210133
9	47	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-06-24 03:18:21.171727	2014-06-24 03:18:21.171727
10	48	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-25 16:56:45.314451	2014-06-25 16:56:45.314451
11	49	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-25 16:59:00.338172	2014-06-25 16:59:00.338172
12	50	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-25 17:00:00.130829	2014-06-25 17:00:00.130829
13	51	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-25 17:05:32.389631	2014-06-25 17:05:32.389631
14	1	Trade	1	User	trade.create	--- {}\n\n	\N	\N	2014-06-25 17:55:06.964613	2014-06-25 17:55:06.964613
15	52	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-26 14:29:22.770772	2014-06-26 14:29:22.770772
16	53	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-26 14:32:04.064742	2014-06-26 14:32:04.064742
17	54	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-26 14:45:43.825696	2014-06-26 14:45:43.825696
18	53	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-06-26 14:48:48.001511	2014-06-26 14:48:48.001511
19	55	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-26 19:31:38.635032	2014-06-26 19:31:38.635032
20	55	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-06-27 04:34:46.898034	2014-06-27 04:34:46.898034
21	47	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-06-27 18:04:59.446219	2014-06-27 18:04:59.446219
22	56	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-29 19:43:55.584884	2014-06-29 19:43:55.584884
23	57	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-29 19:49:50.781556	2014-06-29 19:49:50.781556
24	55	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-06-29 19:50:18.065084	2014-06-29 19:50:18.065084
25	56	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-06-29 19:54:36.315942	2014-06-29 19:54:36.315942
26	58	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-29 20:07:40.864884	2014-06-29 20:07:40.864884
27	59	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-29 20:25:35.000666	2014-06-29 20:25:35.000666
28	58	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-06-29 20:27:05.084058	2014-06-29 20:27:05.084058
29	60	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-29 20:33:50.905596	2014-06-29 20:33:50.905596
30	61	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-06-29 20:36:27.839015	2014-06-29 20:36:27.839015
31	2	Feature	1	User	feature.destroy	--- {}\n\n	\N	\N	2014-06-29 20:46:36.029933	2014-06-29 20:46:36.029933
32	62	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-07-01 00:21:56.218341	2014-07-01 00:21:56.218341
33	62	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-01 00:39:48.377079	2014-07-01 00:39:48.377079
34	62	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-01 03:57:06.548729	2014-07-01 03:57:06.548729
35	5	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:21:27.896565	2014-07-30 03:21:27.896565
36	1	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:21:39.981586	2014-07-30 03:21:39.981586
37	6	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:21:54.86326	2014-07-30 03:21:54.86326
38	7	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:22:30.279545	2014-07-30 03:22:30.279545
39	13	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:22:41.411591	2014-07-30 03:22:41.411591
40	9	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:22:55.071415	2014-07-30 03:22:55.071415
41	10	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:23:14.768647	2014-07-30 03:23:14.768647
42	11	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:23:28.192031	2014-07-30 03:23:28.192031
43	14	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:23:40.283781	2014-07-30 03:23:40.283781
44	2	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:24:12.626646	2014-07-30 03:24:12.626646
45	3	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:24:26.770979	2014-07-30 03:24:26.770979
46	4	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:24:39.247322	2014-07-30 03:24:39.247322
47	15	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:24:52.548922	2014-07-30 03:24:52.548922
48	8	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:25:04.008728	2014-07-30 03:25:04.008728
49	16	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:25:17.313513	2014-07-30 03:25:17.313513
50	12	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:25:30.271298	2014-07-30 03:25:30.271298
51	29	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:25:42.596829	2014-07-30 03:25:42.596829
52	25	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:25:54.627681	2014-07-30 03:25:54.627681
53	26	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:26:06.876658	2014-07-30 03:26:06.876658
54	21	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:26:21.022073	2014-07-30 03:26:21.022073
55	17	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:26:32.692328	2014-07-30 03:26:32.692328
56	22	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:26:44.814671	2014-07-30 03:26:44.814671
57	23	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:26:56.573007	2014-07-30 03:26:56.573007
58	24	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:27:08.492603	2014-07-30 03:27:08.492603
59	27	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:27:20.38915	2014-07-30 03:27:20.38915
60	18	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:27:34.284242	2014-07-30 03:27:34.284242
61	19	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:27:45.791734	2014-07-30 03:27:45.791734
62	31	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:27:57.444219	2014-07-30 03:27:57.444219
63	32	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:28:09.270655	2014-07-30 03:28:09.270655
64	30	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:28:22.219544	2014-07-30 03:28:22.219544
65	28	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:28:34.098135	2014-07-30 03:28:34.098135
66	20	NflTeam	1	User	nfl_team.update	--- {}\n\n	\N	\N	2014-07-30 03:28:44.764778	2014-07-30 03:28:44.764778
67	21	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:29:35.174676	2014-07-30 03:29:35.174676
68	30	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:29:54.324188	2014-07-30 03:29:54.324188
69	26	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:30:16.156046	2014-07-30 03:30:16.156046
70	28	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:30:32.402816	2014-07-30 03:30:32.402816
71	29	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:30:53.530718	2014-07-30 03:30:53.530718
72	31	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:32:05.5335	2014-07-30 03:32:05.5335
73	25	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:32:52.3384	2014-07-30 03:32:52.3384
74	32	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:33:27.726059	2014-07-30 03:33:27.726059
75	34	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:33:47.584585	2014-07-30 03:33:47.584585
76	35	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:35:07.377447	2014-07-30 03:35:07.377447
77	40	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-07-30 03:35:31.404984	2014-07-30 03:35:31.404984
78	9	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:17:03.281198	2014-08-01 03:17:03.281198
79	77	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-01 03:32:29.601559	2014-08-01 03:32:29.601559
80	292	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-01 03:32:29.625089	2014-08-01 03:32:29.625089
81	77	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:32:57.777041	2014-08-01 03:32:57.777041
82	77	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:33:05.126792	2014-08-01 03:33:05.126792
83	14	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:33:54.605339	2014-08-01 03:33:54.605339
84	14	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:34:04.211037	2014-08-01 03:34:04.211037
85	78	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-01 03:34:35.056665	2014-08-01 03:34:35.056665
86	267	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-01 03:34:35.071995	2014-08-01 03:34:35.071995
87	78	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:34:59.194967	2014-08-01 03:34:59.194967
88	78	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:35:07.194459	2014-08-01 03:35:07.194459
89	267	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-01 03:35:34.423076	2014-08-01 03:35:34.423076
90	21	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:36:02.10916	2014-08-01 03:36:02.10916
91	52	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:38:57.784874	2014-08-01 03:38:57.784874
92	52	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:39:08.694166	2014-08-01 03:39:08.694166
93	79	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-01 03:39:38.664361	2014-08-01 03:39:38.664361
94	297	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-01 03:39:38.678224	2014-08-01 03:39:38.678224
95	79	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:39:46.344271	2014-08-01 03:39:46.344271
96	79	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:39:54.128188	2014-08-01 03:39:54.128188
97	60	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:40:24.275941	2014-08-01 03:40:24.275941
98	63	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:41:01.828595	2014-08-01 03:41:01.828595
99	63	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:41:11.950809	2014-08-01 03:41:11.950809
100	80	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-01 03:41:35.162249	2014-08-01 03:41:35.162249
101	339	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-01 03:41:35.177507	2014-08-01 03:41:35.177507
102	80	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:41:45.238147	2014-08-01 03:41:45.238147
103	80	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:41:53.49769	2014-08-01 03:41:53.49769
104	69	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:42:25.710689	2014-08-01 03:42:25.710689
105	81	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-01 03:43:20.842583	2014-08-01 03:43:20.842583
106	296	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-01 03:43:20.855498	2014-08-01 03:43:20.855498
107	81	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:43:26.611584	2014-08-01 03:43:26.611584
108	81	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 03:43:32.843375	2014-08-01 03:43:32.843375
109	67	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 15:18:46.462554	2014-08-01 15:18:46.462554
110	67	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 15:20:48.165328	2014-08-01 15:20:48.165328
111	5	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 15:21:07.506118	2014-08-01 15:21:07.506118
112	26	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-01 15:21:52.961904	2014-08-01 15:21:52.961904
113	3	Player	1	User	player.import	--- {}\n\n	\N	\N	2014-08-02 05:53:47.966592	2014-08-02 05:53:47.966592
114	63	Feature	1	User	feature.create	--- {}\n\n	\N	\N	2014-08-02 16:13:53.124466	2014-08-02 16:13:53.124466
115	63	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-08-02 16:14:00.76867	2014-08-02 16:14:00.76867
116	2	Trade	2	User	trade.create	--- {}\n\n	\N	\N	2014-08-02 16:47:47.857622	2014-08-02 16:47:47.857622
117	1	Trade	5	User	trade.update	--- {}\n\n	\N	\N	2014-08-02 17:59:30.438824	2014-08-02 17:59:30.438824
118	1	Trade	5	User	trade.update	--- {}\n\n	\N	\N	2014-08-02 17:59:47.817987	2014-08-02 17:59:47.817987
119	1	Trade	5	User	trade.update	--- {}\n\n	\N	\N	2014-08-02 18:01:31.156523	2014-08-02 18:01:31.156523
120	1	Trade	5	User	trade.update	--- {}\n\n	\N	\N	2014-08-02 18:24:34.491707	2014-08-02 18:24:34.491707
121	3	Trade	14	User	trade.create	--- {}\n\n	\N	\N	2014-08-02 18:35:11.578335	2014-08-02 18:35:11.578335
122	296	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-02 18:49:54.296659	2014-08-02 18:49:54.296659
123	57	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-08-02 19:28:47.314294	2014-08-02 19:28:47.314294
124	56	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-08-02 19:30:56.694915	2014-08-02 19:30:56.694915
125	82	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-02 20:33:47.117521	2014-08-02 20:33:47.117521
126	262	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-02 20:33:47.198832	2014-08-02 20:33:47.198832
127	82	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-02 20:34:08.470843	2014-08-02 20:34:08.470843
128	82	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-02 20:34:18.338477	2014-08-02 20:34:18.338477
129	83	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-02 20:43:10.946192	2014-08-02 20:43:10.946192
130	5	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-02 20:43:10.961085	2014-08-02 20:43:10.961085
131	83	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-02 20:43:22.351118	2014-08-02 20:43:22.351118
132	84	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-02 20:44:18.283083	2014-08-02 20:44:18.283083
133	279	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-02 20:44:18.298957	2014-08-02 20:44:18.298957
134	84	Contract	1	User	contract.update	--- {}\n\n	\N	\N	2014-08-02 20:44:30.675116	2014-08-02 20:44:30.675116
135	2	Trade	1	User	trade.update	--- {}\n\n	\N	\N	2014-08-02 20:55:26.537605	2014-08-02 20:55:26.537605
136	324	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-04 14:38:31.073688	2014-08-04 14:38:31.073688
137	356	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-04 19:25:29.453866	2014-08-04 19:25:29.453866
138	42	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 03:11:47.036112	2014-08-06 03:11:47.036112
139	221	Player	1	User	player.destroy	--- {}\n\n	\N	\N	2014-08-06 13:49:31.951531	2014-08-06 13:49:31.951531
140	335	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:07:40.480282	2014-08-06 14:07:40.480282
141	332	Player	1	User	player.destroy	--- {}\n\n	\N	\N	2014-08-06 14:07:50.505267	2014-08-06 14:07:50.505267
142	331	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:08:18.14116	2014-08-06 14:08:18.14116
143	325	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:08:55.681141	2014-08-06 14:08:55.681141
144	326	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:09:19.339738	2014-08-06 14:09:19.339738
145	322	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:09:44.833168	2014-08-06 14:09:44.833168
146	319	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:10:15.822392	2014-08-06 14:10:15.822392
147	310	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:10:38.895308	2014-08-06 14:10:38.895308
148	303	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:11:00.386181	2014-08-06 14:11:00.386181
149	288	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:12:41.483533	2014-08-06 14:12:41.483533
150	259	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:21:36.556733	2014-08-06 14:21:36.556733
151	257	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:54:59.269557	2014-08-06 14:54:59.269557
152	256	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:55:58.072059	2014-08-06 14:55:58.072059
153	248	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:56:26.385633	2014-08-06 14:56:26.385633
154	247	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 14:59:14.72392	2014-08-06 14:59:14.72392
155	246	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:00:26.300745	2014-08-06 15:00:26.300745
156	240	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:10:06.549843	2014-08-06 15:10:06.549843
157	234	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:11:03.83405	2014-08-06 15:11:03.83405
158	230	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:26:20.777786	2014-08-06 15:26:20.777786
159	263	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:27:37.309521	2014-08-06 15:27:37.309521
160	261	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:27:46.689562	2014-08-06 15:27:46.689562
161	272	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:28:18.476594	2014-08-06 15:28:18.476594
162	280	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:29:10.465883	2014-08-06 15:29:10.465883
163	282	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:29:39.360228	2014-08-06 15:29:39.360228
164	286	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:30:21.101982	2014-08-06 15:30:21.101982
165	231	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:31:23.199942	2014-08-06 15:31:23.199942
166	314	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:31:49.057074	2014-08-06 15:31:49.057074
167	334	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-06 15:32:13.213271	2014-08-06 15:32:13.213271
168	261	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-07 13:17:11.467175	2014-08-07 13:17:11.467175
169	272	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-07 13:17:25.44109	2014-08-07 13:17:25.44109
170	263	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-07 13:17:41.435385	2014-08-07 13:17:41.435385
171	282	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-07 13:17:55.447734	2014-08-07 13:17:55.447734
172	58	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-08-09 20:30:51.45982	2014-08-09 20:30:51.45982
173	59	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-08-09 20:31:14.899908	2014-08-09 20:31:14.899908
174	60	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-08-09 20:31:33.668007	2014-08-09 20:31:33.668007
175	62	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-08-09 20:32:02.362722	2014-08-09 20:32:02.362722
176	4	Trade	5	User	trade.create	--- {}\n\n	\N	\N	2014-08-12 21:08:08.18962	2014-08-12 21:08:08.18962
177	4	Trade	6	User	trade.update	--- {}\n\n	\N	\N	2014-08-12 21:38:56.44809	2014-08-12 21:38:56.44809
178	5	Trade	7	User	trade.create	--- {}\n\n	\N	\N	2014-08-13 14:43:01.206726	2014-08-13 14:43:01.206726
179	5	Trade	1	User	trade.update	--- {}\n\n	\N	\N	2014-08-13 14:48:23.222663	2014-08-13 14:48:23.222663
180	85	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-28 01:10:34.246616	2014-08-28 01:10:34.246616
181	42	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-28 01:10:34.273127	2014-08-28 01:10:34.273127
182	86	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-28 01:10:48.541021	2014-08-28 01:10:48.541021
183	138	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-28 01:10:48.552342	2014-08-28 01:10:48.552342
184	87	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-28 01:11:42.442972	2014-08-28 01:11:42.442972
185	340	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-28 01:11:42.458053	2014-08-28 01:11:42.458053
186	88	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-28 01:12:01.222867	2014-08-28 01:12:01.222867
187	363	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-28 01:12:01.2357	2014-08-28 01:12:01.2357
188	89	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-28 01:12:18.914999	2014-08-28 01:12:18.914999
189	330	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-28 01:12:18.927855	2014-08-28 01:12:18.927855
190	90	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-28 01:12:39.121906	2014-08-28 01:12:39.121906
191	355	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-28 01:12:39.132466	2014-08-28 01:12:39.132466
192	91	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-08-28 01:12:55.227795	2014-08-28 01:12:55.227795
193	41	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-08-28 01:12:55.240847	2014-08-28 01:12:55.240847
194	62	Feature	1	User	feature.update	--- {}\n\n	\N	\N	2014-08-28 01:22:12.948348	2014-08-28 01:22:12.948348
195	92	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 03:18:42.722592	2014-09-02 03:18:42.722592
196	26	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 03:18:42.74521	2014-09-02 03:18:42.74521
197	93	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 03:21:11.879304	2014-09-02 03:21:11.879304
198	278	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 03:21:11.946475	2014-09-02 03:21:11.946475
199	94	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 03:21:39.207815	2014-09-02 03:21:39.207815
200	103	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 03:21:39.222452	2014-09-02 03:21:39.222452
201	95	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:27:16.949062	2014-09-02 22:27:16.949062
202	265	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:27:16.977884	2014-09-02 22:27:16.977884
203	96	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:28:58.301616	2014-09-02 22:28:58.301616
204	27	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:28:58.326112	2014-09-02 22:28:58.326112
205	97	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:39:22.605368	2014-09-02 22:39:22.605368
206	266	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:39:22.627623	2014-09-02 22:39:22.627623
207	98	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:39:56.048453	2014-09-02 22:39:56.048453
208	29	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:39:56.062179	2014-09-02 22:39:56.062179
209	99	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:42:12.041022	2014-09-02 22:42:12.041022
210	364	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:42:12.052814	2014-09-02 22:42:12.052814
211	100	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:42:53.69205	2014-09-02 22:42:53.69205
212	244	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:42:53.746828	2014-09-02 22:42:53.746828
213	101	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:43:24.875981	2014-09-02 22:43:24.875981
214	241	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:43:24.888679	2014-09-02 22:43:24.888679
215	102	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:43:48.505974	2014-09-02 22:43:48.505974
216	130	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:43:48.518251	2014-09-02 22:43:48.518251
217	103	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:44:08.261666	2014-09-02 22:44:08.261666
218	317	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:44:08.277177	2014-09-02 22:44:08.277177
219	104	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:44:37.492129	2014-09-02 22:44:37.492129
220	328	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:44:37.505	2014-09-02 22:44:37.505
221	105	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:44:58.877821	2014-09-02 22:44:58.877821
222	68	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:44:58.888477	2014-09-02 22:44:58.888477
223	106	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:45:37.265077	2014-09-02 22:45:37.265077
224	333	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:45:37.276653	2014-09-02 22:45:37.276653
225	107	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:45:53.235705	2014-09-02 22:45:53.235705
226	350	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:45:53.248418	2014-09-02 22:45:53.248418
227	108	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:46:25.350579	2014-09-02 22:46:25.350579
228	122	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:46:25.364132	2014-09-02 22:46:25.364132
229	109	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:46:49.421652	2014-09-02 22:46:49.421652
230	191	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:46:49.433942	2014-09-02 22:46:49.433942
231	110	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:47:07.762001	2014-09-02 22:47:07.762001
232	182	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:47:07.788677	2014-09-02 22:47:07.788677
233	111	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:47:28.265062	2014-09-02 22:47:28.265062
234	141	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:47:28.275417	2014-09-02 22:47:28.275417
235	112	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:47:44.617318	2014-09-02 22:47:44.617318
236	264	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:47:44.627879	2014-09-02 22:47:44.627879
237	113	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:48:01.875952	2014-09-02 22:48:01.875952
238	307	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:48:01.935382	2014-09-02 22:48:01.935382
239	114	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:48:18.122718	2014-09-02 22:48:18.122718
240	352	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:48:18.133934	2014-09-02 22:48:18.133934
241	115	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:55:12.092301	2014-09-02 22:55:12.092301
242	362	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:55:12.104739	2014-09-02 22:55:12.104739
243	116	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:56:15.899966	2014-09-02 22:56:15.899966
244	359	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:56:15.913177	2014-09-02 22:56:15.913177
245	117	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:56:40.907882	2014-09-02 22:56:40.907882
246	367	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:56:40.964529	2014-09-02 22:56:40.964529
247	118	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:57:05.802698	2014-09-02 22:57:05.802698
248	210	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:57:05.814755	2014-09-02 22:57:05.814755
249	119	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-02 22:57:52.19105	2014-09-02 22:57:52.19105
250	197	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-02 22:57:52.202322	2014-09-02 22:57:52.202322
251	120	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:07:43.262098	2014-09-03 01:07:43.262098
252	17	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:07:43.281961	2014-09-03 01:07:43.281961
253	121	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:08:03.545884	2014-09-03 01:08:03.545884
254	346	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:08:03.557172	2014-09-03 01:08:03.557172
255	122	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:08:37.840576	2014-09-03 01:08:37.840576
256	158	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:08:37.852417	2014-09-03 01:08:37.852417
257	123	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:10:01.146063	2014-09-03 01:10:01.146063
258	44	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:10:01.158401	2014-09-03 01:10:01.158401
259	124	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:10:17.360263	2014-09-03 01:10:17.360263
260	249	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:10:17.372135	2014-09-03 01:10:17.372135
261	125	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:11:04.142002	2014-09-03 01:11:04.142002
262	6	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:11:04.154955	2014-09-03 01:11:04.154955
263	126	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:11:21.899073	2014-09-03 01:11:21.899073
264	365	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:11:21.911099	2014-09-03 01:11:21.911099
265	127	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:11:37.566706	2014-09-03 01:11:37.566706
266	123	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:11:37.581036	2014-09-03 01:11:37.581036
267	128	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:12:45.131792	2014-09-03 01:12:45.131792
268	69	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:12:45.144715	2014-09-03 01:12:45.144715
269	129	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:13:07.973365	2014-09-03 01:13:07.973365
270	43	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:13:07.985533	2014-09-03 01:13:07.985533
271	130	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:13:49.252015	2014-09-03 01:13:49.252015
272	125	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:13:49.264164	2014-09-03 01:13:49.264164
273	131	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:14:02.808684	2014-09-03 01:14:02.808684
274	7	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:14:02.821247	2014-09-03 01:14:02.821247
275	132	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:14:16.343178	2014-09-03 01:14:16.343178
276	181	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:14:16.355689	2014-09-03 01:14:16.355689
277	133	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:15:09.756381	2014-09-03 01:15:09.756381
278	58	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:15:09.77022	2014-09-03 01:15:09.77022
279	134	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:15:42.8772	2014-09-03 01:15:42.8772
280	237	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:15:42.889331	2014-09-03 01:15:42.889331
281	135	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:15:59.951779	2014-09-03 01:15:59.951779
282	101	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:15:59.964572	2014-09-03 01:15:59.964572
283	136	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:20:49.801579	2014-09-03 01:20:49.801579
284	134	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:20:49.814093	2014-09-03 01:20:49.814093
285	137	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:21:20.162851	2014-09-03 01:21:20.162851
286	189	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:21:20.175168	2014-09-03 01:21:20.175168
287	138	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:27:57.12245	2014-09-03 01:27:57.12245
288	162	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:27:57.135671	2014-09-03 01:27:57.135671
289	139	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:28:16.286499	2014-09-03 01:28:16.286499
290	81	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:28:16.297279	2014-09-03 01:28:16.297279
291	140	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:33:44.729528	2014-09-03 01:33:44.729528
292	344	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:33:44.742538	2014-09-03 01:33:44.742538
293	141	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:33:57.796502	2014-09-03 01:33:57.796502
294	353	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:33:57.877223	2014-09-03 01:33:57.877223
295	142	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:34:14.465992	2014-09-03 01:34:14.465992
296	196	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:34:14.480002	2014-09-03 01:34:14.480002
297	143	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:34:34.621957	2014-09-03 01:34:34.621957
298	23	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:34:34.635152	2014-09-03 01:34:34.635152
299	144	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:35:12.506215	2014-09-03 01:35:12.506215
300	83	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:35:12.519766	2014-09-03 01:35:12.519766
301	145	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:35:25.415164	2014-09-03 01:35:25.415164
302	11	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:35:25.428909	2014-09-03 01:35:25.428909
303	146	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:35:38.970829	2014-09-03 01:35:38.970829
304	161	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:35:38.983002	2014-09-03 01:35:38.983002
305	147	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:42:01.251616	2014-09-03 01:42:01.251616
306	295	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:42:01.265007	2014-09-03 01:42:01.265007
307	148	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:42:15.962895	2014-09-03 01:42:15.962895
308	24	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:42:15.973696	2014-09-03 01:42:15.973696
309	377	Player	3	User	player.create	--- {}\n\n	\N	\N	2014-09-03 01:47:33.458739	2014-09-03 01:47:33.458739
310	149	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:47:44.576222	2014-09-03 01:47:44.576222
311	377	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:47:44.587384	2014-09-03 01:47:44.587384
312	378	Player	3	User	player.create	--- {}\n\n	\N	\N	2014-09-03 01:48:19.306685	2014-09-03 01:48:19.306685
313	150	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:48:28.547782	2014-09-03 01:48:28.547782
314	378	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:48:28.66741	2014-09-03 01:48:28.66741
315	151	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:49:57.004065	2014-09-03 01:49:57.004065
316	208	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:49:57.014739	2014-09-03 01:49:57.014739
317	379	Player	3	User	player.create	--- {}\n\n	\N	\N	2014-09-03 01:54:31.378571	2014-09-03 01:54:31.378571
318	152	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:54:37.841854	2014-09-03 01:54:37.841854
319	379	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:54:37.854436	2014-09-03 01:54:37.854436
320	153	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:55:15.363896	2014-09-03 01:55:15.363896
321	227	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:55:15.37566	2014-09-03 01:55:15.37566
322	154	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:56:04.579682	2014-09-03 01:56:04.579682
323	204	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:56:04.594359	2014-09-03 01:56:04.594359
324	155	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:56:20.307125	2014-09-03 01:56:20.307125
325	289	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:56:20.318709	2014-09-03 01:56:20.318709
326	156	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:56:38.286975	2014-09-03 01:56:38.286975
327	47	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:56:38.30392	2014-09-03 01:56:38.30392
328	157	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:56:49.915576	2014-09-03 01:56:49.915576
329	157	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:56:49.927035	2014-09-03 01:56:49.927035
330	158	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:56:59.416824	2014-09-03 01:56:59.416824
331	281	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:56:59.431306	2014-09-03 01:56:59.431306
332	159	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:57:16.575146	2014-09-03 01:57:16.575146
333	341	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:57:16.587309	2014-09-03 01:57:16.587309
334	160	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:57:27.968463	2014-09-03 01:57:27.968463
335	190	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:57:27.980849	2014-09-03 01:57:27.980849
336	161	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:57:48.172632	2014-09-03 01:57:48.172632
337	171	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:57:48.183447	2014-09-03 01:57:48.183447
338	162	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:58:05.211678	2014-09-03 01:58:05.211678
339	40	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:58:05.224529	2014-09-03 01:58:05.224529
340	163	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:58:17.437758	2014-09-03 01:58:17.437758
341	139	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:58:17.44995	2014-09-03 01:58:17.44995
342	164	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 01:58:48.903002	2014-09-03 01:58:48.903002
343	338	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 01:58:48.914969	2014-09-03 01:58:48.914969
344	165	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:00:31.628912	2014-09-03 02:00:31.628912
345	220	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:00:31.64064	2014-09-03 02:00:31.64064
346	166	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:00:44.811374	2014-09-03 02:00:44.811374
347	273	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:00:44.823288	2014-09-03 02:00:44.823288
348	167	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:12:10.465616	2014-09-03 02:12:10.465616
349	324	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:12:10.477533	2014-09-03 02:12:10.477533
350	168	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:12:30.941894	2014-09-03 02:12:30.941894
351	34	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:12:30.952383	2014-09-03 02:12:30.952383
352	169	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:13:05.426811	2014-09-03 02:13:05.426811
353	354	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:13:05.439248	2014-09-03 02:13:05.439248
354	170	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:13:18.120183	2014-09-03 02:13:18.120183
355	309	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:13:18.132939	2014-09-03 02:13:18.132939
356	171	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:15:03.565002	2014-09-03 02:15:03.565002
357	167	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:15:03.577096	2014-09-03 02:15:03.577096
358	172	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:15:58.310639	2014-09-03 02:15:58.310639
359	30	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:15:58.323674	2014-09-03 02:15:58.323674
360	90	Player	3	User	player.destroy	--- {}\n\n	\N	\N	2014-09-03 02:16:29.834457	2014-09-03 02:16:29.834457
361	173	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:16:42.620267	2014-09-03 02:16:42.620267
362	305	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:16:42.651865	2014-09-03 02:16:42.651865
363	380	Player	3	User	player.create	--- {}\n\n	\N	\N	2014-09-03 02:17:55.043756	2014-09-03 02:17:55.043756
364	174	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:18:03.167502	2014-09-03 02:18:03.167502
365	380	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:18:03.179247	2014-09-03 02:18:03.179247
366	175	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:18:36.232386	2014-09-03 02:18:36.232386
367	343	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:18:36.245241	2014-09-03 02:18:36.245241
368	176	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:19:06.80594	2014-09-03 02:19:06.80594
369	361	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:19:06.819217	2014-09-03 02:19:06.819217
370	177	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:19:17.731057	2014-09-03 02:19:17.731057
371	87	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:19:17.742056	2014-09-03 02:19:17.742056
372	178	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:19:28.709587	2014-09-03 02:19:28.709587
373	276	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:19:28.720043	2014-09-03 02:19:28.720043
374	381	Player	3	User	player.create	--- {}\n\n	\N	\N	2014-09-03 02:20:18.291776	2014-09-03 02:20:18.291776
375	179	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:20:25.062335	2014-09-03 02:20:25.062335
376	381	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:20:25.073145	2014-09-03 02:20:25.073145
377	180	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:22:32.407265	2014-09-03 02:22:32.407265
378	201	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:22:32.531632	2014-09-03 02:22:32.531632
379	181	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:22:47.13634	2014-09-03 02:22:47.13634
380	12	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:22:47.149014	2014-09-03 02:22:47.149014
381	182	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:23:00.480359	2014-09-03 02:23:00.480359
382	166	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:23:00.493306	2014-09-03 02:23:00.493306
383	183	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:24:15.663426	2014-09-03 02:24:15.663426
384	120	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:24:15.676811	2014-09-03 02:24:15.676811
385	184	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:24:29.39482	2014-09-03 02:24:29.39482
386	336	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:24:29.407856	2014-09-03 02:24:29.407856
387	185	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:24:37.746274	2014-09-03 02:24:37.746274
388	39	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:24:37.75861	2014-09-03 02:24:37.75861
389	136	Player	3	User	player.destroy	--- {}\n\n	\N	\N	2014-09-03 02:24:58.297098	2014-09-03 02:24:58.297098
390	186	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:25:10.297772	2014-09-03 02:25:10.297772
391	284	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:25:10.309458	2014-09-03 02:25:10.309458
392	187	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:25:26.33143	2014-09-03 02:25:26.33143
393	4	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:25:26.343386	2014-09-03 02:25:26.343386
394	188	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:25:36.949789	2014-09-03 02:25:36.949789
395	13	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:25:36.961567	2014-09-03 02:25:36.961567
396	189	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:25:51.567897	2014-09-03 02:25:51.567897
397	192	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:25:51.578519	2014-09-03 02:25:51.578519
398	190	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:26:00.230836	2014-09-03 02:26:00.230836
399	314	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:26:00.244421	2014-09-03 02:26:00.244421
400	191	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:26:11.310335	2014-09-03 02:26:11.310335
401	213	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:26:11.322258	2014-09-03 02:26:11.322258
402	192	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:26:26.0309	2014-09-03 02:26:26.0309
403	95	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:26:26.041879	2014-09-03 02:26:26.041879
404	193	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:27:06.875749	2014-09-03 02:27:06.875749
405	357	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:27:06.887801	2014-09-03 02:27:06.887801
406	322	Player	3	User	player.destroy	--- {}\n\n	\N	\N	2014-09-03 02:27:27.339983	2014-09-03 02:27:27.339983
407	194	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:27:40.325412	2014-09-03 02:27:40.325412
408	97	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:27:40.337714	2014-09-03 02:27:40.337714
409	195	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:27:49.971162	2014-09-03 02:27:49.971162
410	224	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:27:49.993872	2014-09-03 02:27:49.993872
411	196	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:28:05.092461	2014-09-03 02:28:05.092461
412	218	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:28:05.103991	2014-09-03 02:28:05.103991
413	197	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:28:16.535032	2014-09-03 02:28:16.535032
414	147	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:28:16.546961	2014-09-03 02:28:16.546961
415	9	Contract	3	User	contract.update	--- {}\n\n	\N	\N	2014-09-03 02:28:59.434183	2014-09-03 02:28:59.434183
416	38	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:28:59.440241	2014-09-03 02:28:59.440241
417	198	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:29:16.538158	2014-09-03 02:29:16.538158
418	253	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:29:16.554747	2014-09-03 02:29:16.554747
419	199	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:29:27.228095	2014-09-03 02:29:27.228095
420	160	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:29:27.242407	2014-09-03 02:29:27.242407
421	38	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:30:07.562184	2014-09-03 02:30:07.562184
422	200	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:30:22.410457	2014-09-03 02:30:22.410457
423	38	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:30:22.42272	2014-09-03 02:30:22.42272
424	201	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:31:17.245709	2014-09-03 02:31:17.245709
425	225	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:31:17.258612	2014-09-03 02:31:17.258612
426	202	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:31:32.6441	2014-09-03 02:31:32.6441
427	348	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:31:32.657054	2014-09-03 02:31:32.657054
428	203	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:31:47.664261	2014-09-03 02:31:47.664261
429	366	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:31:47.675784	2014-09-03 02:31:47.675784
430	204	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:31:56.867417	2014-09-03 02:31:56.867417
431	345	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:31:56.878412	2014-09-03 02:31:56.878412
432	205	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:32:06.421925	2014-09-03 02:32:06.421925
433	209	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:32:06.434053	2014-09-03 02:32:06.434053
434	206	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:32:39.096667	2014-09-03 02:32:39.096667
435	85	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:32:39.111386	2014-09-03 02:32:39.111386
436	207	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:33:28.398719	2014-09-03 02:33:28.398719
437	360	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:33:28.409575	2014-09-03 02:33:28.409575
438	382	Player	3	User	player.create	--- {}\n\n	\N	\N	2014-09-03 02:34:30.167922	2014-09-03 02:34:30.167922
439	208	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:34:41.089245	2014-09-03 02:34:41.089245
440	382	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:34:41.10127	2014-09-03 02:34:41.10127
441	209	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:35:04.343278	2014-09-03 02:35:04.343278
442	8	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:35:04.355078	2014-09-03 02:35:04.355078
443	210	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:35:21.284316	2014-09-03 02:35:21.284316
444	302	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:35:21.29682	2014-09-03 02:35:21.29682
445	383	Player	3	User	player.create	--- {}\n\n	\N	\N	2014-09-03 02:36:13.512263	2014-09-03 02:36:13.512263
446	211	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:36:22.924578	2014-09-03 02:36:22.924578
447	383	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:36:22.935114	2014-09-03 02:36:22.935114
448	384	Player	3	User	player.create	--- {}\n\n	\N	\N	2014-09-03 02:37:16.068567	2014-09-03 02:37:16.068567
449	212	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:37:23.378084	2014-09-03 02:37:23.378084
450	384	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:37:23.392236	2014-09-03 02:37:23.392236
451	385	Player	3	User	player.create	--- {}\n\n	\N	\N	2014-09-03 02:46:08.167811	2014-09-03 02:46:08.167811
452	213	Contract	3	User	contract.create	--- {}\n\n	\N	\N	2014-09-03 02:46:27.324606	2014-09-03 02:46:27.324606
453	385	Player	3	User	player.update	--- {}\n\n	\N	\N	2014-09-03 02:46:27.345314	2014-09-03 02:46:27.345314
454	213	Contract	1	User	contract.destroy	--- {}\n\n	\N	\N	2014-09-04 21:45:15.098062	2014-09-04 21:45:15.098062
455	385	Player	1	User	player.destroy	--- {}\n\n	\N	\N	2014-09-04 21:45:29.810053	2014-09-04 21:45:29.810053
456	6	Trade	3	User	trade.create	--- {}\n\n	\N	\N	2014-09-04 21:57:06.808433	2014-09-04 21:57:06.808433
457	214	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-09-07 15:59:20.078582	2014-09-07 15:59:20.078582
458	246	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-09-07 15:59:20.097785	2014-09-07 15:59:20.097785
459	215	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-09-09 19:17:06.267813	2014-09-09 19:17:06.267813
460	217	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-09-09 19:17:06.288847	2014-09-09 19:17:06.288847
461	386	Player	1	User	player.create	--- {}\n\n	\N	\N	2014-09-09 19:18:28.007037	2014-09-09 19:18:28.007037
462	216	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-09-09 19:18:35.694998	2014-09-09 19:18:35.694998
463	386	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-09-09 19:18:35.707824	2014-09-09 19:18:35.707824
464	217	Contract	1	User	contract.create	--- {}\n\n	\N	\N	2014-09-10 17:41:32.571051	2014-09-10 17:41:32.571051
465	206	Player	1	User	player.update	--- {}\n\n	\N	\N	2014-09-10 17:41:32.584167	2014-09-10 17:41:32.584167
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('activities_id_seq', 465, true);


--
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY awards (id, name, amount, user_id, created_at, updated_at, payout_id, notes) FROM stdin;
1	Champion	600	5	2013-09-18 15:05:44.765652	2013-09-25 01:57:58.60894	1	
2	Runner Up	300	8	2013-09-18 15:05:44.768697	2013-09-25 01:57:58.618783	1	
3	Third Place	100	16	2013-09-18 15:05:44.770258	2013-09-25 01:57:58.620401	1	
4	Philip Division Champ	40	5	2013-09-18 15:05:44.771763	2013-09-25 01:57:58.621765	1	
5	Russell Division Champ	40	8	2013-09-18 15:05:44.773239	2013-09-25 01:57:58.623073	1	
6	Most Points During Season	25	5	2013-09-18 15:05:44.774752	2013-09-25 01:57:58.624411	1	
7	High Score - Week 1	5	15	2013-09-18 15:05:44.776257	2013-09-25 01:57:58.625987	1	(169.85)
8	High Score - Week 2	5	8	2013-09-18 15:05:44.777719	2013-09-25 01:57:58.627694	1	(162.30)
9	High Score - Week 3	5	7	2013-09-18 15:05:44.779381	2013-09-25 01:57:58.629356	1	(189.68)
10	High Score - Week 4	5	1	2013-09-18 15:05:44.780829	2013-09-25 01:57:58.630952	1	(179.23)
11	High Score - Week 5	5	4	2013-09-18 15:05:44.782336	2013-09-25 01:57:58.632591	1	(164.28)
12	High Score - Week 6	5	1	2013-09-18 15:05:44.783828	2013-09-25 01:57:58.634246	1	(144.92)
13	High Score - Week 7	5	10	2013-09-18 15:05:44.785322	2013-09-25 01:57:58.635854	1	(159.34)
14	High Score - Week 8	5	1	2013-09-18 15:05:44.786873	2013-09-25 01:57:58.637443	1	(172.23)
15	High Score - Week 9	5	5	2013-09-18 15:05:44.788388	2013-09-25 01:57:58.638731	1	(180.00)
16	High Score - Week 10	5	7	2013-09-18 15:05:44.789823	2013-09-25 01:57:58.640113	1	(161.44)
17	High Score - Week 11	5	5	2013-09-18 15:05:44.791389	2013-09-25 01:57:58.641456	1	(145.53)
18	High Score - Week 12	5	4	2013-09-18 15:05:44.792825	2013-09-25 01:57:58.642745	1	(163.40)
19	High Score - Week 13	5	5	2013-09-18 15:05:44.794272	2013-09-25 01:57:58.644061	1	(175.23)
20	Highest Weekly Total/Season	10	7	2013-09-18 15:05:44.795813	2013-09-25 01:57:58.645369	1	(189.68)
46	Champion	600	6	2013-12-12 15:50:36.55127	2014-01-26 23:34:33.936945	3	
21	Trash Talker	10	1	2013-09-18 15:05:44.797289	2013-09-25 01:58:41.38593	1	
23	Champion	600	8	2013-09-25 02:09:36.817348	2013-09-25 02:09:36.817348	2	
24	Runner-up	300	15	2013-09-25 02:09:36.820635	2013-09-25 02:09:36.820635	2	
25	Third place	100	16	2013-09-25 02:09:36.822202	2013-09-25 02:09:36.822202	2	
26	Philip Division Champ	40	3	2013-09-25 02:09:36.823693	2013-09-25 02:09:36.823693	2	
27	Russell Division Champ	40	8	2013-09-25 02:09:36.825147	2013-09-25 02:09:36.825147	2	
28	Most Points During Season	25	8	2013-09-25 02:09:36.826648	2013-09-25 02:09:36.826648	2	
29	High Score - Week 1	5	3	2013-09-25 02:09:36.828148	2013-09-25 02:09:36.828148	2	(167.20)
30	High Score - Week 2	5	2	2013-09-25 02:09:36.829755	2013-09-25 02:09:36.829755	2	(197.16)
31	High Score - Week 3	5	4	2013-09-25 02:09:36.831269	2013-09-25 02:09:36.831269	2	(158.03)
32	High Score - Week 4	5	11	2013-09-25 02:09:36.832778	2013-09-25 02:09:36.832778	2	(180.68)
33	High Score - Week 5	5	1	2013-09-25 02:09:36.834353	2013-09-25 02:09:36.834353	2	(163.00)
34	High Score - Week 6	5	11	2013-09-25 02:09:36.835914	2013-09-25 02:09:36.835914	2	(145.22)
35	High Score - Week 7	5	1	2013-09-25 02:09:36.837337	2013-09-25 02:09:36.837337	2	(152.21)
36	High Score - Week 8	5	8	2013-09-25 02:09:36.838749	2013-09-25 02:09:36.838749	2	(161.98)
37	High Score - Week 9	5	10	2013-09-25 02:09:36.840174	2013-09-25 02:09:36.840174	2	(149.14)
38	High Score - Week 10	5	2	2013-09-25 02:09:36.841606	2013-09-25 02:09:36.841606	2	(156.84)
39	High Score - Week 11	5	8	2013-09-25 02:09:36.843007	2013-09-25 02:09:36.843007	2	(141.00)
40	High Score - Week 12	5	17	2013-09-25 02:09:36.844457	2013-09-25 02:09:36.844457	2	(154.74)
41	High Score - Week 13	5	8	2013-09-25 02:09:36.845937	2013-09-25 02:09:36.845937	2	(196.82)
42	Highest Weekly Total/Season	10	2	2013-09-25 02:09:36.847335	2013-09-25 02:09:36.847335	2	(197.16)
43	Trash Talker	10	1	2013-09-25 02:09:36.848802	2013-09-25 02:09:36.848802	2	
47	Runner up	300	7	2013-12-12 15:50:36.56262	2014-01-26 23:34:33.939405	3	
48	Third place	100	4	2013-12-12 15:50:36.567108	2014-01-26 23:34:33.940631	3	
49	Philip Division Champ	40	6	2013-12-12 15:50:36.57147	2014-01-26 23:34:33.941795	3	
50	Russell Division Champ	40	7	2013-12-12 15:50:36.573757	2014-01-26 23:34:33.942987	3	
51	Most points during the season	25	4	2013-12-12 15:50:36.57598	2014-01-26 23:34:33.944142	3	
52	High score - Week 1	5	5	2013-12-12 15:50:36.578211	2014-01-26 23:34:33.945323	3	(188.72)
53	High score - Week 2	5	14	2013-12-12 15:50:36.580073	2014-01-26 23:34:33.946536	3	(182.93)
54	High score - Week 3	5	12	2013-12-12 15:50:36.582116	2014-01-26 23:34:33.947751	3	(163.98)
55	High score - Week 4	5	1	2013-12-12 15:50:36.584439	2014-01-26 23:34:33.948969	3	(174.19)
56	High score - Week 5	5	1	2013-12-12 15:50:36.586199	2014-01-26 23:34:33.950176	3	(196.99)
57	High score - Week 6	5	1	2013-12-12 15:50:36.588573	2014-01-26 23:34:33.951374	3	(160.51)
58	High score - Week 7	5	1	2013-12-12 15:50:36.590932	2014-01-26 23:34:33.95259	3	(155.50)
59	High score - Week 8	5	13	2013-12-12 15:50:36.593116	2014-01-26 23:34:33.95381	3	(171.26)
60	High score - Week 9	5	4	2013-12-12 15:50:36.595185	2014-01-26 23:34:33.955028	3	(179.26)
61	High score - Week 10	5	1	2013-12-12 15:50:36.596616	2014-01-26 23:34:33.956215	3	(161.88)
62	High score - Week 11	5	4	2013-12-12 15:50:36.597993	2014-01-26 23:34:33.957438	3	(173.81)
63	High score - Week 12	5	8	2013-12-12 15:50:36.599384	2014-01-26 23:34:33.958653	3	(159.75)
64	High score - Week 13	5	7	2013-12-12 15:50:36.600787	2014-01-26 23:34:33.959896	3	(160.22)
65	Highest weekly total/season	10	1	2013-12-12 15:50:36.602285	2014-01-26 23:34:33.961113	3	(196.99)
66	Smallest margin of defeat	5	2	2013-12-12 15:50:36.603672	2014-01-26 23:34:33.962297	3	(1.06)
68	Losing to lowest winning score	5	3	2013-12-12 15:50:36.60645	2014-01-26 23:34:33.964718	3	(98.56)
22	Worst Record	5	1	2013-09-18 15:05:44.798781	2014-01-26 23:35:57.141764	1	3-10
44	Worst Record	5	17	2013-09-25 02:09:36.850249	2014-01-26 23:38:42.850725	2	4-9
69	NFL Super Bowl prediction	5	3	2013-12-12 15:50:36.60784	2014-02-03 16:32:13.725452	3	
70	Misappropriated Funds	5	3	2014-02-07 16:08:00.726126	2014-02-09 03:22:08.453019	1	Unaccounted for Super Bowl pick money
71	Misappropriated Funds	5	3	2014-02-07 16:08:21.212342	2014-02-09 03:22:27.466595	2	Unaccounted for Super Bowl pick money
67	Worst record	5	2	2013-12-12 15:50:36.605062	2014-02-09 21:21:11.858781	3	1-12
72	Champion	600	\N	2014-09-09 14:13:45.91114	2014-09-09 14:13:45.91114	4	
73	Runner up	300	\N	2014-09-09 14:13:45.918851	2014-09-09 14:13:45.918851	4	
74	Third place	100	\N	2014-09-09 14:13:45.920297	2014-09-09 14:13:45.920297	4	
75	Philip Division Champ	40	\N	2014-09-09 14:13:45.921904	2014-09-09 14:13:45.921904	4	
76	Russell Division Champ	40	\N	2014-09-09 14:13:45.923701	2014-09-09 14:13:45.923701	4	
77	Most points during the season	25	\N	2014-09-09 14:13:45.925466	2014-09-09 14:13:45.925466	4	
78	High score - Week 1	5	14	2014-09-09 14:13:45.927176	2014-09-09 14:13:45.927176	4	159.32
79	High score - Week 2	5	\N	2014-09-09 14:13:45.928904	2014-09-09 14:13:45.928904	4	
80	High score - Week 3	5	\N	2014-09-09 14:13:45.930468	2014-09-09 14:13:45.930468	4	
81	High score - Week 4	5	\N	2014-09-09 14:13:45.93187	2014-09-09 14:13:45.93187	4	
82	High score - Week 5	5	\N	2014-09-09 14:13:45.93331	2014-09-09 14:13:45.93331	4	
83	High score - Week 6	5	\N	2014-09-09 14:13:45.934726	2014-09-09 14:13:45.934726	4	
84	High score - Week 7	5	\N	2014-09-09 14:13:45.936316	2014-09-09 14:13:45.936316	4	
85	High score - Week 8	5	\N	2014-09-09 14:13:45.937799	2014-09-09 14:13:45.937799	4	
86	High score - Week 9	5	\N	2014-09-09 14:13:45.939199	2014-09-09 14:13:45.939199	4	
87	High score - Week 10	5	\N	2014-09-09 14:13:45.940821	2014-09-09 14:13:45.940821	4	
88	High score - Week 11	5	\N	2014-09-09 14:13:45.942302	2014-09-09 14:13:45.942302	4	
89	High score - Week 12	5	\N	2014-09-09 14:13:45.943706	2014-09-09 14:13:45.943706	4	
90	High score - Week 13	5	\N	2014-09-09 14:13:45.945135	2014-09-09 14:13:45.945135	4	
91	Highest weekly total/season	10	\N	2014-09-09 14:13:45.946546	2014-09-09 14:13:45.946546	4	
92	Smallest margin of defeat	5	\N	2014-09-09 14:13:45.947951	2014-09-09 14:13:45.947951	4	
93	Worst record	5	\N	2014-09-09 14:13:45.949435	2014-09-09 14:13:45.949435	4	
94	Losing to lowest winning score	5	\N	2014-09-09 14:13:45.950842	2014-09-09 14:13:45.950842	4	
95	NFL Super Bowl prediction	5	\N	2014-09-09 14:13:45.952247	2014-09-09 14:13:45.952247	4	
\.


--
-- Name: awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('awards_id_seq', 95, true);


--
-- Data for Name: budgets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY budgets (id, team_id, year, amount, created_at, updated_at) FROM stdin;
1	11	2013	130	2014-04-05 20:52:26.75908	2014-04-05 20:52:26.75908
2	11	2014	130	2014-04-05 20:52:26.807071	2014-04-05 20:52:26.807071
3	11	2015	130	2014-04-05 20:52:26.810971	2014-04-05 20:52:26.810971
4	11	2016	130	2014-04-05 20:52:26.814273	2014-04-05 20:52:26.814273
5	11	2017	130	2014-04-05 20:52:26.817294	2014-04-05 20:52:26.817294
6	11	2018	130	2014-04-05 20:52:26.82037	2014-04-05 20:52:26.82037
7	11	2019	130	2014-04-05 20:52:26.823361	2014-04-05 20:52:26.823361
8	11	2020	130	2014-04-05 20:52:26.826439	2014-04-05 20:52:26.826439
9	11	2021	130	2014-04-05 20:52:26.829501	2014-04-05 20:52:26.829501
10	11	2022	130	2014-04-05 20:52:26.832747	2014-04-05 20:52:26.832747
11	11	2023	130	2014-04-05 20:52:26.836062	2014-04-05 20:52:26.836062
12	11	2024	130	2014-04-05 20:52:26.839112	2014-04-05 20:52:26.839112
13	11	2025	130	2014-04-05 20:52:26.842206	2014-04-05 20:52:26.842206
14	11	2026	130	2014-04-05 20:52:26.845286	2014-04-05 20:52:26.845286
15	11	2027	130	2014-04-05 20:52:26.848398	2014-04-05 20:52:26.848398
16	11	2028	130	2014-04-05 20:52:26.85179	2014-04-05 20:52:26.85179
17	11	2029	130	2014-04-05 20:52:26.855068	2014-04-05 20:52:26.855068
18	11	2030	130	2014-04-05 20:52:26.858256	2014-04-05 20:52:26.858256
19	11	2031	130	2014-04-05 20:52:26.861324	2014-04-05 20:52:26.861324
20	11	2032	130	2014-04-05 20:52:26.864478	2014-04-05 20:52:26.864478
21	11	2033	130	2014-04-05 20:52:26.86768	2014-04-05 20:52:26.86768
22	11	2034	130	2014-04-05 20:52:26.875626	2014-04-05 20:52:26.875626
23	11	2035	130	2014-04-05 20:52:26.880795	2014-04-05 20:52:26.880795
24	11	2036	130	2014-04-05 20:52:26.884259	2014-04-05 20:52:26.884259
25	11	2037	130	2014-04-05 20:52:26.887657	2014-04-05 20:52:26.887657
26	11	2038	130	2014-04-05 20:52:26.890868	2014-04-05 20:52:26.890868
27	11	2039	130	2014-04-05 20:52:26.894074	2014-04-05 20:52:26.894074
28	11	2040	130	2014-04-05 20:52:26.897099	2014-04-05 20:52:26.897099
29	11	2041	130	2014-04-05 20:52:26.900217	2014-04-05 20:52:26.900217
30	11	2042	130	2014-04-05 20:52:26.903876	2014-04-05 20:52:26.903876
31	11	2043	130	2014-04-05 20:52:26.906761	2014-04-05 20:52:26.906761
32	11	2044	130	2014-04-05 20:52:26.909906	2014-04-05 20:52:26.909906
33	11	2045	130	2014-04-05 20:52:26.912926	2014-04-05 20:52:26.912926
34	11	2046	130	2014-04-05 20:52:26.915815	2014-04-05 20:52:26.915815
35	11	2047	130	2014-04-05 20:52:26.918684	2014-04-05 20:52:26.918684
36	11	2048	130	2014-04-05 20:52:26.921532	2014-04-05 20:52:26.921532
37	11	2049	130	2014-04-05 20:52:26.924443	2014-04-05 20:52:26.924443
38	11	2050	130	2014-04-05 20:52:26.927677	2014-04-05 20:52:26.927677
39	11	2051	130	2014-04-05 20:52:26.930887	2014-04-05 20:52:26.930887
40	11	2052	130	2014-04-05 20:52:26.934108	2014-04-05 20:52:26.934108
41	11	2053	130	2014-04-05 20:52:26.936945	2014-04-05 20:52:26.936945
42	11	2054	130	2014-04-05 20:52:26.939893	2014-04-05 20:52:26.939893
43	11	2055	130	2014-04-05 20:52:26.942749	2014-04-05 20:52:26.942749
44	11	2056	130	2014-04-05 20:52:26.945628	2014-04-05 20:52:26.945628
45	11	2057	130	2014-04-05 20:52:26.948583	2014-04-05 20:52:26.948583
46	11	2058	130	2014-04-05 20:52:26.951336	2014-04-05 20:52:26.951336
47	11	2059	130	2014-04-05 20:52:26.954177	2014-04-05 20:52:26.954177
48	11	2060	130	2014-04-05 20:52:26.957033	2014-04-05 20:52:26.957033
49	11	2061	130	2014-04-05 20:52:26.9599	2014-04-05 20:52:26.9599
50	11	2062	130	2014-04-05 20:52:26.962801	2014-04-05 20:52:26.962801
51	13	2013	130	2014-04-05 20:52:26.965711	2014-04-05 20:52:26.965711
52	13	2014	130	2014-04-05 20:52:26.968665	2014-04-05 20:52:26.968665
53	13	2015	130	2014-04-05 20:52:26.971504	2014-04-05 20:52:26.971504
54	13	2016	130	2014-04-05 20:52:26.974466	2014-04-05 20:52:26.974466
55	13	2017	130	2014-04-05 20:52:26.977548	2014-04-05 20:52:26.977548
56	13	2018	130	2014-04-05 20:52:26.981098	2014-04-05 20:52:26.981098
57	13	2019	130	2014-04-05 20:52:26.984079	2014-04-05 20:52:26.984079
58	13	2020	130	2014-04-05 20:52:26.98678	2014-04-05 20:52:26.98678
59	13	2021	130	2014-04-05 20:52:26.989565	2014-04-05 20:52:26.989565
60	13	2022	130	2014-04-05 20:52:26.992285	2014-04-05 20:52:26.992285
61	13	2023	130	2014-04-05 20:52:26.994907	2014-04-05 20:52:26.994907
62	13	2024	130	2014-04-05 20:52:26.999582	2014-04-05 20:52:26.999582
63	13	2025	130	2014-04-05 20:52:27.00923	2014-04-05 20:52:27.00923
64	13	2026	130	2014-04-05 20:52:27.01215	2014-04-05 20:52:27.01215
65	13	2027	130	2014-04-05 20:52:27.022068	2014-04-05 20:52:27.022068
66	13	2028	130	2014-04-05 20:52:27.025272	2014-04-05 20:52:27.025272
67	13	2029	130	2014-04-05 20:52:27.030764	2014-04-05 20:52:27.030764
68	13	2030	130	2014-04-05 20:52:27.034081	2014-04-05 20:52:27.034081
69	13	2031	130	2014-04-05 20:52:27.037049	2014-04-05 20:52:27.037049
70	13	2032	130	2014-04-05 20:52:27.040033	2014-04-05 20:52:27.040033
71	13	2033	130	2014-04-05 20:52:27.042973	2014-04-05 20:52:27.042973
72	13	2034	130	2014-04-05 20:52:27.04581	2014-04-05 20:52:27.04581
73	13	2035	130	2014-04-05 20:52:27.048699	2014-04-05 20:52:27.048699
74	13	2036	130	2014-04-05 20:52:27.051642	2014-04-05 20:52:27.051642
75	13	2037	130	2014-04-05 20:52:27.054541	2014-04-05 20:52:27.054541
76	13	2038	130	2014-04-05 20:52:27.057339	2014-04-05 20:52:27.057339
77	13	2039	130	2014-04-05 20:52:27.060209	2014-04-05 20:52:27.060209
78	13	2040	130	2014-04-05 20:52:27.06308	2014-04-05 20:52:27.06308
79	13	2041	130	2014-04-05 20:52:27.066143	2014-04-05 20:52:27.066143
80	13	2042	130	2014-04-05 20:52:27.06922	2014-04-05 20:52:27.06922
81	13	2043	130	2014-04-05 20:52:27.073969	2014-04-05 20:52:27.073969
82	13	2044	130	2014-04-05 20:52:27.07708	2014-04-05 20:52:27.07708
83	13	2045	130	2014-04-05 20:52:27.080067	2014-04-05 20:52:27.080067
84	13	2046	130	2014-04-05 20:52:27.083033	2014-04-05 20:52:27.083033
85	13	2047	130	2014-04-05 20:52:27.085954	2014-04-05 20:52:27.085954
86	13	2048	130	2014-04-05 20:52:27.089117	2014-04-05 20:52:27.089117
87	13	2049	130	2014-04-05 20:52:27.092156	2014-04-05 20:52:27.092156
88	13	2050	130	2014-04-05 20:52:27.095031	2014-04-05 20:52:27.095031
89	13	2051	130	2014-04-05 20:52:27.097808	2014-04-05 20:52:27.097808
90	13	2052	130	2014-04-05 20:52:27.10094	2014-04-05 20:52:27.10094
91	13	2053	130	2014-04-05 20:52:27.10412	2014-04-05 20:52:27.10412
92	13	2054	130	2014-04-05 20:52:27.107352	2014-04-05 20:52:27.107352
93	13	2055	130	2014-04-05 20:52:27.110356	2014-04-05 20:52:27.110356
94	13	2056	130	2014-04-05 20:52:27.113178	2014-04-05 20:52:27.113178
95	13	2057	130	2014-04-05 20:52:27.115994	2014-04-05 20:52:27.115994
96	13	2058	130	2014-04-05 20:52:27.118833	2014-04-05 20:52:27.118833
97	13	2059	130	2014-04-05 20:52:27.121666	2014-04-05 20:52:27.121666
98	13	2060	130	2014-04-05 20:52:27.124659	2014-04-05 20:52:27.124659
99	13	2061	130	2014-04-05 20:52:27.127708	2014-04-05 20:52:27.127708
100	13	2062	130	2014-04-05 20:52:27.13248	2014-04-05 20:52:27.13248
101	9	2013	130	2014-04-05 20:52:27.13559	2014-04-05 20:52:27.13559
102	9	2014	130	2014-04-05 20:52:27.138512	2014-04-05 20:52:27.138512
103	9	2015	130	2014-04-05 20:52:27.141431	2014-04-05 20:52:27.141431
104	9	2016	130	2014-04-05 20:52:27.144259	2014-04-05 20:52:27.144259
105	9	2017	130	2014-04-05 20:52:27.147111	2014-04-05 20:52:27.147111
106	9	2018	130	2014-04-05 20:52:27.149995	2014-04-05 20:52:27.149995
107	9	2019	130	2014-04-05 20:52:27.15279	2014-04-05 20:52:27.15279
108	9	2020	130	2014-04-05 20:52:27.155688	2014-04-05 20:52:27.155688
109	9	2021	130	2014-04-05 20:52:27.158522	2014-04-05 20:52:27.158522
110	9	2022	130	2014-04-05 20:52:27.161399	2014-04-05 20:52:27.161399
111	9	2023	130	2014-04-05 20:52:27.164408	2014-04-05 20:52:27.164408
112	9	2024	130	2014-04-05 20:52:27.167439	2014-04-05 20:52:27.167439
113	9	2025	130	2014-04-05 20:52:27.170615	2014-04-05 20:52:27.170615
114	9	2026	130	2014-04-05 20:52:27.173483	2014-04-05 20:52:27.173483
115	9	2027	130	2014-04-05 20:52:27.176596	2014-04-05 20:52:27.176596
116	9	2028	130	2014-04-05 20:52:27.179553	2014-04-05 20:52:27.179553
117	9	2029	130	2014-04-05 20:52:27.182358	2014-04-05 20:52:27.182358
118	9	2030	130	2014-04-05 20:52:27.185318	2014-04-05 20:52:27.185318
119	9	2031	130	2014-04-05 20:52:27.188211	2014-04-05 20:52:27.188211
120	9	2032	130	2014-04-05 20:52:27.191347	2014-04-05 20:52:27.191347
121	9	2033	130	2014-04-05 20:52:27.194175	2014-04-05 20:52:27.194175
122	9	2034	130	2014-04-05 20:52:27.196949	2014-04-05 20:52:27.196949
123	9	2035	130	2014-04-05 20:52:27.199738	2014-04-05 20:52:27.199738
124	9	2036	130	2014-04-05 20:52:27.202484	2014-04-05 20:52:27.202484
125	9	2037	130	2014-04-05 20:52:27.20516	2014-04-05 20:52:27.20516
126	9	2038	130	2014-04-05 20:52:27.207911	2014-04-05 20:52:27.207911
127	9	2039	130	2014-04-05 20:52:27.210625	2014-04-05 20:52:27.210625
128	9	2040	130	2014-04-05 20:52:27.213343	2014-04-05 20:52:27.213343
129	9	2041	130	2014-04-05 20:52:27.216024	2014-04-05 20:52:27.216024
130	9	2042	130	2014-04-05 20:52:27.218707	2014-04-05 20:52:27.218707
131	9	2043	130	2014-04-05 20:52:27.22148	2014-04-05 20:52:27.22148
132	9	2044	130	2014-04-05 20:52:27.224474	2014-04-05 20:52:27.224474
133	9	2045	130	2014-04-05 20:52:27.22755	2014-04-05 20:52:27.22755
134	9	2046	130	2014-04-05 20:52:27.230222	2014-04-05 20:52:27.230222
135	9	2047	130	2014-04-05 20:52:27.233071	2014-04-05 20:52:27.233071
136	9	2048	130	2014-04-05 20:52:27.235814	2014-04-05 20:52:27.235814
137	9	2049	130	2014-04-05 20:52:27.238531	2014-04-05 20:52:27.238531
138	9	2050	130	2014-04-05 20:52:27.243325	2014-04-05 20:52:27.243325
139	9	2051	130	2014-04-05 20:52:27.246132	2014-04-05 20:52:27.246132
140	9	2052	130	2014-04-05 20:52:27.248837	2014-04-05 20:52:27.248837
141	9	2053	130	2014-04-05 20:52:27.251558	2014-04-05 20:52:27.251558
142	9	2054	130	2014-04-05 20:52:27.254217	2014-04-05 20:52:27.254217
143	9	2055	130	2014-04-05 20:52:27.256856	2014-04-05 20:52:27.256856
144	9	2056	130	2014-04-05 20:52:27.259542	2014-04-05 20:52:27.259542
145	9	2057	130	2014-04-05 20:52:27.262191	2014-04-05 20:52:27.262191
146	9	2058	130	2014-04-05 20:52:27.264874	2014-04-05 20:52:27.264874
147	9	2059	130	2014-04-05 20:52:27.267638	2014-04-05 20:52:27.267638
148	9	2060	130	2014-04-05 20:52:27.27041	2014-04-05 20:52:27.27041
149	9	2061	130	2014-04-05 20:52:27.27365	2014-04-05 20:52:27.27365
150	9	2062	130	2014-04-05 20:52:27.276396	2014-04-05 20:52:27.276396
151	14	2013	130	2014-04-05 20:52:27.279319	2014-04-05 20:52:27.279319
152	14	2014	130	2014-04-05 20:52:27.28231	2014-04-05 20:52:27.28231
153	14	2015	130	2014-04-05 20:52:27.28509	2014-04-05 20:52:27.28509
154	14	2016	130	2014-04-05 20:52:27.287967	2014-04-05 20:52:27.287967
155	14	2017	130	2014-04-05 20:52:27.291577	2014-04-05 20:52:27.291577
156	14	2018	130	2014-04-05 20:52:27.294466	2014-04-05 20:52:27.294466
157	14	2019	130	2014-04-05 20:52:27.297486	2014-04-05 20:52:27.297486
158	14	2020	130	2014-04-05 20:52:27.30017	2014-04-05 20:52:27.30017
159	14	2021	130	2014-04-05 20:52:27.303337	2014-04-05 20:52:27.303337
160	14	2022	130	2014-04-05 20:52:27.30682	2014-04-05 20:52:27.30682
161	14	2023	130	2014-04-05 20:52:27.310011	2014-04-05 20:52:27.310011
162	14	2024	130	2014-04-05 20:52:27.312805	2014-04-05 20:52:27.312805
163	14	2025	130	2014-04-05 20:52:27.315561	2014-04-05 20:52:27.315561
164	14	2026	130	2014-04-05 20:52:27.318467	2014-04-05 20:52:27.318467
165	14	2027	130	2014-04-05 20:52:27.321568	2014-04-05 20:52:27.321568
166	14	2028	130	2014-04-05 20:52:27.324581	2014-04-05 20:52:27.324581
167	14	2029	130	2014-04-05 20:52:27.327411	2014-04-05 20:52:27.327411
168	14	2030	130	2014-04-05 20:52:27.330179	2014-04-05 20:52:27.330179
169	14	2031	130	2014-04-05 20:52:27.333024	2014-04-05 20:52:27.333024
170	14	2032	130	2014-04-05 20:52:27.335803	2014-04-05 20:52:27.335803
171	14	2033	130	2014-04-05 20:52:27.33856	2014-04-05 20:52:27.33856
172	14	2034	130	2014-04-05 20:52:27.341308	2014-04-05 20:52:27.341308
173	14	2035	130	2014-04-05 20:52:27.344084	2014-04-05 20:52:27.344084
174	14	2036	130	2014-04-05 20:52:27.346975	2014-04-05 20:52:27.346975
175	14	2037	130	2014-04-05 20:52:27.349732	2014-04-05 20:52:27.349732
176	14	2038	130	2014-04-05 20:52:27.354108	2014-04-05 20:52:27.354108
177	14	2039	130	2014-04-05 20:52:27.357144	2014-04-05 20:52:27.357144
178	14	2040	130	2014-04-05 20:52:27.359897	2014-04-05 20:52:27.359897
179	14	2041	130	2014-04-05 20:52:27.362666	2014-04-05 20:52:27.362666
180	14	2042	130	2014-04-05 20:52:27.365589	2014-04-05 20:52:27.365589
181	14	2043	130	2014-04-05 20:52:27.368455	2014-04-05 20:52:27.368455
182	14	2044	130	2014-04-05 20:52:27.371256	2014-04-05 20:52:27.371256
183	14	2045	130	2014-04-05 20:52:27.374231	2014-04-05 20:52:27.374231
184	14	2046	130	2014-04-05 20:52:27.376946	2014-04-05 20:52:27.376946
185	14	2047	130	2014-04-05 20:52:27.379809	2014-04-05 20:52:27.379809
186	14	2048	130	2014-04-05 20:52:27.382788	2014-04-05 20:52:27.382788
187	14	2049	130	2014-04-05 20:52:27.38577	2014-04-05 20:52:27.38577
188	14	2050	130	2014-04-05 20:52:27.38875	2014-04-05 20:52:27.38875
189	14	2051	130	2014-04-05 20:52:27.39182	2014-04-05 20:52:27.39182
190	14	2052	130	2014-04-05 20:52:27.394873	2014-04-05 20:52:27.394873
191	14	2053	130	2014-04-05 20:52:27.397916	2014-04-05 20:52:27.397916
192	14	2054	130	2014-04-05 20:52:27.400758	2014-04-05 20:52:27.400758
193	14	2055	130	2014-04-05 20:52:27.404182	2014-04-05 20:52:27.404182
194	14	2056	130	2014-04-05 20:52:27.407625	2014-04-05 20:52:27.407625
195	14	2057	130	2014-04-05 20:52:27.410525	2014-04-05 20:52:27.410525
196	14	2058	130	2014-04-05 20:52:27.413301	2014-04-05 20:52:27.413301
197	14	2059	130	2014-04-05 20:52:27.416074	2014-04-05 20:52:27.416074
198	14	2060	130	2014-04-05 20:52:27.418902	2014-04-05 20:52:27.418902
199	14	2061	130	2014-04-05 20:52:27.422382	2014-04-05 20:52:27.422382
200	14	2062	130	2014-04-05 20:52:27.425128	2014-04-05 20:52:27.425128
201	15	2013	130	2014-04-05 20:52:27.427904	2014-04-05 20:52:27.427904
202	15	2014	130	2014-04-05 20:52:27.430699	2014-04-05 20:52:27.430699
203	15	2015	130	2014-04-05 20:52:27.433423	2014-04-05 20:52:27.433423
204	15	2016	130	2014-04-05 20:52:27.436151	2014-04-05 20:52:27.436151
205	15	2017	130	2014-04-05 20:52:27.43887	2014-04-05 20:52:27.43887
206	15	2018	130	2014-04-05 20:52:27.441662	2014-04-05 20:52:27.441662
207	15	2019	130	2014-04-05 20:52:27.444441	2014-04-05 20:52:27.444441
208	15	2020	130	2014-04-05 20:52:27.4473	2014-04-05 20:52:27.4473
209	15	2021	130	2014-04-05 20:52:27.450124	2014-04-05 20:52:27.450124
210	15	2022	130	2014-04-05 20:52:27.452908	2014-04-05 20:52:27.452908
211	15	2023	130	2014-04-05 20:52:27.455657	2014-04-05 20:52:27.455657
212	15	2024	130	2014-04-05 20:52:27.458433	2014-04-05 20:52:27.458433
213	15	2025	130	2014-04-05 20:52:27.461296	2014-04-05 20:52:27.461296
214	15	2026	130	2014-04-05 20:52:27.465979	2014-04-05 20:52:27.465979
215	15	2027	130	2014-04-05 20:52:27.469229	2014-04-05 20:52:27.469229
216	15	2028	130	2014-04-05 20:52:27.472103	2014-04-05 20:52:27.472103
217	15	2029	130	2014-04-05 20:52:27.475479	2014-04-05 20:52:27.475479
218	15	2030	130	2014-04-05 20:52:27.478436	2014-04-05 20:52:27.478436
219	15	2031	130	2014-04-05 20:52:27.481556	2014-04-05 20:52:27.481556
220	15	2032	130	2014-04-05 20:52:27.484353	2014-04-05 20:52:27.484353
221	15	2033	130	2014-04-05 20:52:27.487171	2014-04-05 20:52:27.487171
222	15	2034	130	2014-04-05 20:52:27.490013	2014-04-05 20:52:27.490013
223	15	2035	130	2014-04-05 20:52:27.492789	2014-04-05 20:52:27.492789
224	15	2036	130	2014-04-05 20:52:27.495602	2014-04-05 20:52:27.495602
225	15	2037	130	2014-04-05 20:52:27.49844	2014-04-05 20:52:27.49844
226	15	2038	130	2014-04-05 20:52:27.501542	2014-04-05 20:52:27.501542
227	15	2039	130	2014-04-05 20:52:27.504365	2014-04-05 20:52:27.504365
228	15	2040	130	2014-04-05 20:52:27.507133	2014-04-05 20:52:27.507133
229	15	2041	130	2014-04-05 20:52:27.5099	2014-04-05 20:52:27.5099
230	15	2042	130	2014-04-05 20:52:27.512646	2014-04-05 20:52:27.512646
231	15	2043	130	2014-04-05 20:52:27.515344	2014-04-05 20:52:27.515344
232	15	2044	130	2014-04-05 20:52:27.518117	2014-04-05 20:52:27.518117
233	15	2045	130	2014-04-05 20:52:27.521254	2014-04-05 20:52:27.521254
234	15	2046	130	2014-04-05 20:52:27.524262	2014-04-05 20:52:27.524262
235	15	2047	130	2014-04-05 20:52:27.527167	2014-04-05 20:52:27.527167
236	15	2048	130	2014-04-05 20:52:27.529962	2014-04-05 20:52:27.529962
237	15	2049	130	2014-04-05 20:52:27.53295	2014-04-05 20:52:27.53295
238	15	2050	130	2014-04-05 20:52:27.535818	2014-04-05 20:52:27.535818
239	15	2051	130	2014-04-05 20:52:27.538636	2014-04-05 20:52:27.538636
240	15	2052	130	2014-04-05 20:52:27.541378	2014-04-05 20:52:27.541378
241	15	2053	130	2014-04-05 20:52:27.54419	2014-04-05 20:52:27.54419
242	15	2054	130	2014-04-05 20:52:27.546945	2014-04-05 20:52:27.546945
243	15	2055	130	2014-04-05 20:52:27.549707	2014-04-05 20:52:27.549707
244	15	2056	130	2014-04-05 20:52:27.552432	2014-04-05 20:52:27.552432
245	15	2057	130	2014-04-05 20:52:27.555231	2014-04-05 20:52:27.555231
246	15	2058	130	2014-04-05 20:52:27.55797	2014-04-05 20:52:27.55797
247	15	2059	130	2014-04-05 20:52:27.560674	2014-04-05 20:52:27.560674
248	15	2060	130	2014-04-05 20:52:27.563364	2014-04-05 20:52:27.563364
249	15	2061	130	2014-04-05 20:52:27.566175	2014-04-05 20:52:27.566175
250	15	2062	130	2014-04-05 20:52:27.568862	2014-04-05 20:52:27.568862
251	12	2013	130	2014-04-05 20:52:27.573038	2014-04-05 20:52:27.573038
252	12	2014	130	2014-04-05 20:52:27.576044	2014-04-05 20:52:27.576044
253	12	2015	130	2014-04-05 20:52:27.580591	2014-04-05 20:52:27.580591
254	12	2016	130	2014-04-05 20:52:27.583586	2014-04-05 20:52:27.583586
255	12	2017	130	2014-04-05 20:52:27.586497	2014-04-05 20:52:27.586497
256	12	2018	130	2014-04-05 20:52:27.589324	2014-04-05 20:52:27.589324
257	12	2019	130	2014-04-05 20:52:27.592983	2014-04-05 20:52:27.592983
258	12	2020	130	2014-04-05 20:52:27.5958	2014-04-05 20:52:27.5958
259	12	2021	130	2014-04-05 20:52:27.598759	2014-04-05 20:52:27.598759
260	12	2022	130	2014-04-05 20:52:27.603051	2014-04-05 20:52:27.603051
261	12	2023	130	2014-04-05 20:52:27.605936	2014-04-05 20:52:27.605936
262	12	2024	130	2014-04-05 20:52:27.608763	2014-04-05 20:52:27.608763
263	12	2025	130	2014-04-05 20:52:27.612975	2014-04-05 20:52:27.612975
264	12	2026	130	2014-04-05 20:52:27.615985	2014-04-05 20:52:27.615985
265	12	2027	130	2014-04-05 20:52:27.6189	2014-04-05 20:52:27.6189
266	12	2028	130	2014-04-05 20:52:27.623104	2014-04-05 20:52:27.623104
267	12	2029	130	2014-04-05 20:52:27.627579	2014-04-05 20:52:27.627579
268	12	2030	130	2014-04-05 20:52:27.630547	2014-04-05 20:52:27.630547
269	12	2031	130	2014-04-05 20:52:27.633782	2014-04-05 20:52:27.633782
270	12	2032	130	2014-04-05 20:52:27.636914	2014-04-05 20:52:27.636914
271	12	2033	130	2014-04-05 20:52:27.639979	2014-04-05 20:52:27.639979
272	12	2034	130	2014-04-05 20:52:27.643066	2014-04-05 20:52:27.643066
273	12	2035	130	2014-04-05 20:52:27.646089	2014-04-05 20:52:27.646089
274	12	2036	130	2014-04-05 20:52:27.648925	2014-04-05 20:52:27.648925
275	12	2037	130	2014-04-05 20:52:27.65529	2014-04-05 20:52:27.65529
276	12	2038	130	2014-04-05 20:52:27.658496	2014-04-05 20:52:27.658496
277	12	2039	130	2014-04-05 20:52:27.663165	2014-04-05 20:52:27.663165
278	12	2040	130	2014-04-05 20:52:27.666212	2014-04-05 20:52:27.666212
279	12	2041	130	2014-04-05 20:52:27.669252	2014-04-05 20:52:27.669252
280	12	2042	130	2014-04-05 20:52:27.673041	2014-04-05 20:52:27.673041
281	12	2043	130	2014-04-05 20:52:27.676258	2014-04-05 20:52:27.676258
282	12	2044	130	2014-04-05 20:52:27.67915	2014-04-05 20:52:27.67915
283	12	2045	130	2014-04-05 20:52:27.683093	2014-04-05 20:52:27.683093
284	12	2046	130	2014-04-05 20:52:27.686046	2014-04-05 20:52:27.686046
285	12	2047	130	2014-04-05 20:52:27.688865	2014-04-05 20:52:27.688865
286	12	2048	130	2014-04-05 20:52:27.717237	2014-04-05 20:52:27.717237
287	12	2049	130	2014-04-05 20:52:27.721233	2014-04-05 20:52:27.721233
288	12	2050	130	2014-04-05 20:52:27.725132	2014-04-05 20:52:27.725132
289	12	2051	130	2014-04-05 20:52:27.728783	2014-04-05 20:52:27.728783
290	12	2052	130	2014-04-05 20:52:27.733068	2014-04-05 20:52:27.733068
291	12	2053	130	2014-04-05 20:52:27.736677	2014-04-05 20:52:27.736677
292	12	2054	130	2014-04-05 20:52:27.74019	2014-04-05 20:52:27.74019
293	12	2055	130	2014-04-05 20:52:27.743666	2014-04-05 20:52:27.743666
294	12	2056	130	2014-04-05 20:52:27.747145	2014-04-05 20:52:27.747145
295	12	2057	130	2014-04-05 20:52:27.750763	2014-04-05 20:52:27.750763
296	12	2058	130	2014-04-05 20:52:27.754229	2014-04-05 20:52:27.754229
297	12	2059	130	2014-04-05 20:52:27.757618	2014-04-05 20:52:27.757618
298	12	2060	130	2014-04-05 20:52:27.760912	2014-04-05 20:52:27.760912
299	12	2061	130	2014-04-05 20:52:27.763864	2014-04-05 20:52:27.763864
300	12	2062	130	2014-04-05 20:52:27.767455	2014-04-05 20:52:27.767455
301	7	2013	130	2014-04-05 20:52:27.770877	2014-04-05 20:52:27.770877
302	7	2014	130	2014-04-05 20:52:27.774276	2014-04-05 20:52:27.774276
303	7	2015	130	2014-04-05 20:52:27.777768	2014-04-05 20:52:27.777768
304	7	2016	130	2014-04-05 20:52:27.781104	2014-04-05 20:52:27.781104
305	7	2017	130	2014-04-05 20:52:27.784343	2014-04-05 20:52:27.784343
306	7	2018	130	2014-04-05 20:52:27.787717	2014-04-05 20:52:27.787717
307	7	2019	130	2014-04-05 20:52:27.791006	2014-04-05 20:52:27.791006
308	7	2020	130	2014-04-05 20:52:27.79432	2014-04-05 20:52:27.79432
309	7	2021	130	2014-04-05 20:52:27.797611	2014-04-05 20:52:27.797611
310	7	2022	130	2014-04-05 20:52:27.800922	2014-04-05 20:52:27.800922
311	7	2023	130	2014-04-05 20:52:27.804246	2014-04-05 20:52:27.804246
312	7	2024	130	2014-04-05 20:52:27.807599	2014-04-05 20:52:27.807599
313	7	2025	130	2014-04-05 20:52:27.81094	2014-04-05 20:52:27.81094
314	7	2026	130	2014-04-05 20:52:27.814398	2014-04-05 20:52:27.814398
315	7	2027	130	2014-04-05 20:52:27.817655	2014-04-05 20:52:27.817655
316	7	2028	130	2014-04-05 20:52:27.820946	2014-04-05 20:52:27.820946
317	7	2029	130	2014-04-05 20:52:27.824067	2014-04-05 20:52:27.824067
318	7	2030	130	2014-04-05 20:52:27.82691	2014-04-05 20:52:27.82691
319	7	2031	130	2014-04-05 20:52:27.82991	2014-04-05 20:52:27.82991
320	7	2032	130	2014-04-05 20:52:27.833189	2014-04-05 20:52:27.833189
321	7	2033	130	2014-04-05 20:52:27.836408	2014-04-05 20:52:27.836408
322	7	2034	130	2014-04-05 20:52:27.839633	2014-04-05 20:52:27.839633
323	7	2035	130	2014-04-05 20:52:27.843259	2014-04-05 20:52:27.843259
324	7	2036	130	2014-04-05 20:52:27.84654	2014-04-05 20:52:27.84654
325	7	2037	130	2014-04-05 20:52:27.849929	2014-04-05 20:52:27.849929
326	7	2038	130	2014-04-05 20:52:27.85323	2014-04-05 20:52:27.85323
327	7	2039	130	2014-04-05 20:52:27.856668	2014-04-05 20:52:27.856668
328	7	2040	130	2014-04-05 20:52:27.860013	2014-04-05 20:52:27.860013
329	7	2041	130	2014-04-05 20:52:27.863307	2014-04-05 20:52:27.863307
330	7	2042	130	2014-04-05 20:52:27.868332	2014-04-05 20:52:27.868332
331	7	2043	130	2014-04-05 20:52:27.873503	2014-04-05 20:52:27.873503
332	7	2044	130	2014-04-05 20:52:27.877063	2014-04-05 20:52:27.877063
333	7	2045	130	2014-04-05 20:52:27.880958	2014-04-05 20:52:27.880958
334	7	2046	130	2014-04-05 20:52:27.885026	2014-04-05 20:52:27.885026
335	7	2047	130	2014-04-05 20:52:27.888582	2014-04-05 20:52:27.888582
336	7	2048	130	2014-04-05 20:52:27.893306	2014-04-05 20:52:27.893306
337	7	2049	130	2014-04-05 20:52:27.896713	2014-04-05 20:52:27.896713
338	7	2050	130	2014-04-05 20:52:27.899916	2014-04-05 20:52:27.899916
339	7	2051	130	2014-04-05 20:52:27.903327	2014-04-05 20:52:27.903327
340	7	2052	130	2014-04-05 20:52:27.906747	2014-04-05 20:52:27.906747
341	7	2053	130	2014-04-05 20:52:27.910027	2014-04-05 20:52:27.910027
342	7	2054	130	2014-04-05 20:52:27.913361	2014-04-05 20:52:27.913361
343	7	2055	130	2014-04-05 20:52:27.916735	2014-04-05 20:52:27.916735
344	7	2056	130	2014-04-05 20:52:27.920234	2014-04-05 20:52:27.920234
345	7	2057	130	2014-04-05 20:52:27.923774	2014-04-05 20:52:27.923774
346	7	2058	130	2014-04-05 20:52:27.927202	2014-04-05 20:52:27.927202
347	7	2059	130	2014-04-05 20:52:27.930817	2014-04-05 20:52:27.930817
348	7	2060	130	2014-04-05 20:52:27.934325	2014-04-05 20:52:27.934325
349	7	2061	130	2014-04-05 20:52:27.937939	2014-04-05 20:52:27.937939
350	7	2062	130	2014-04-05 20:52:27.943568	2014-04-05 20:52:27.943568
351	8	2013	130	2014-04-05 20:52:27.947121	2014-04-05 20:52:27.947121
352	8	2014	130	2014-04-05 20:52:27.950455	2014-04-05 20:52:27.950455
353	8	2015	130	2014-04-05 20:52:27.953895	2014-04-05 20:52:27.953895
354	8	2016	130	2014-04-05 20:52:27.957331	2014-04-05 20:52:27.957331
355	8	2017	130	2014-04-05 20:52:27.96075	2014-04-05 20:52:27.96075
356	8	2018	130	2014-04-05 20:52:27.964387	2014-04-05 20:52:27.964387
357	8	2019	130	2014-04-05 20:52:27.967372	2014-04-05 20:52:27.967372
358	8	2020	130	2014-04-05 20:52:27.970813	2014-04-05 20:52:27.970813
359	8	2021	130	2014-04-05 20:52:27.974163	2014-04-05 20:52:27.974163
360	8	2022	130	2014-04-05 20:52:27.977428	2014-04-05 20:52:27.977428
361	8	2023	130	2014-04-05 20:52:27.980742	2014-04-05 20:52:27.980742
362	8	2024	130	2014-04-05 20:52:27.983934	2014-04-05 20:52:27.983934
363	8	2025	130	2014-04-05 20:52:27.987226	2014-04-05 20:52:27.987226
364	8	2026	130	2014-04-05 20:52:27.990545	2014-04-05 20:52:27.990545
365	8	2027	130	2014-04-05 20:52:27.994036	2014-04-05 20:52:27.994036
366	8	2028	130	2014-04-05 20:52:27.99757	2014-04-05 20:52:27.99757
367	8	2029	130	2014-04-05 20:52:28.00342	2014-04-05 20:52:28.00342
368	8	2030	130	2014-04-05 20:52:28.007037	2014-04-05 20:52:28.007037
369	8	2031	130	2014-04-05 20:52:28.010932	2014-04-05 20:52:28.010932
370	8	2032	130	2014-04-05 20:52:28.014409	2014-04-05 20:52:28.014409
371	8	2033	130	2014-04-05 20:52:28.017974	2014-04-05 20:52:28.017974
372	8	2034	130	2014-04-05 20:52:28.021429	2014-04-05 20:52:28.021429
373	8	2035	130	2014-04-05 20:52:28.024932	2014-04-05 20:52:28.024932
374	8	2036	130	2014-04-05 20:52:28.028496	2014-04-05 20:52:28.028496
375	8	2037	130	2014-04-05 20:52:28.032045	2014-04-05 20:52:28.032045
376	8	2038	130	2014-04-05 20:52:28.035039	2014-04-05 20:52:28.035039
377	8	2039	130	2014-04-05 20:52:28.038045	2014-04-05 20:52:28.038045
378	8	2040	130	2014-04-05 20:52:28.041406	2014-04-05 20:52:28.041406
379	8	2041	130	2014-04-05 20:52:28.044648	2014-04-05 20:52:28.044648
380	8	2042	130	2014-04-05 20:52:28.047937	2014-04-05 20:52:28.047937
381	8	2043	130	2014-04-05 20:52:28.051189	2014-04-05 20:52:28.051189
382	8	2044	130	2014-04-05 20:52:28.054654	2014-04-05 20:52:28.054654
383	8	2045	130	2014-04-05 20:52:28.057982	2014-04-05 20:52:28.057982
384	8	2046	130	2014-04-05 20:52:28.061317	2014-04-05 20:52:28.061317
385	8	2047	130	2014-04-05 20:52:28.064781	2014-04-05 20:52:28.064781
386	8	2048	130	2014-04-05 20:52:28.068521	2014-04-05 20:52:28.068521
387	8	2049	130	2014-04-05 20:52:28.071809	2014-04-05 20:52:28.071809
388	8	2050	130	2014-04-05 20:52:28.07508	2014-04-05 20:52:28.07508
389	8	2051	130	2014-04-05 20:52:28.079335	2014-04-05 20:52:28.079335
390	8	2052	130	2014-04-05 20:52:28.084969	2014-04-05 20:52:28.084969
391	8	2053	130	2014-04-05 20:52:28.089446	2014-04-05 20:52:28.089446
392	8	2054	130	2014-04-05 20:52:28.092746	2014-04-05 20:52:28.092746
393	8	2055	130	2014-04-05 20:52:28.096139	2014-04-05 20:52:28.096139
394	8	2056	130	2014-04-05 20:52:28.099565	2014-04-05 20:52:28.099565
395	8	2057	130	2014-04-05 20:52:28.103065	2014-04-05 20:52:28.103065
396	8	2058	130	2014-04-05 20:52:28.10625	2014-04-05 20:52:28.10625
397	8	2059	130	2014-04-05 20:52:28.109865	2014-04-05 20:52:28.109865
398	8	2060	130	2014-04-05 20:52:28.11347	2014-04-05 20:52:28.11347
399	8	2061	130	2014-04-05 20:52:28.11704	2014-04-05 20:52:28.11704
400	8	2062	130	2014-04-05 20:52:28.120503	2014-04-05 20:52:28.120503
401	17	2013	130	2014-04-05 20:52:28.123962	2014-04-05 20:52:28.123962
402	17	2014	130	2014-04-05 20:52:28.127966	2014-04-05 20:52:28.127966
403	17	2015	130	2014-04-05 20:52:28.131735	2014-04-05 20:52:28.131735
404	17	2016	130	2014-04-05 20:52:28.13561	2014-04-05 20:52:28.13561
405	17	2017	130	2014-04-05 20:52:28.139461	2014-04-05 20:52:28.139461
406	17	2018	130	2014-04-05 20:52:28.143558	2014-04-05 20:52:28.143558
407	17	2019	130	2014-04-05 20:52:28.14736	2014-04-05 20:52:28.14736
408	17	2020	130	2014-04-05 20:52:28.151111	2014-04-05 20:52:28.151111
409	17	2021	130	2014-04-05 20:52:28.154871	2014-04-05 20:52:28.154871
410	17	2022	130	2014-04-05 20:52:28.158773	2014-04-05 20:52:28.158773
411	17	2023	130	2014-04-05 20:52:28.162507	2014-04-05 20:52:28.162507
412	17	2024	130	2014-04-05 20:52:28.166289	2014-04-05 20:52:28.166289
413	17	2025	130	2014-04-05 20:52:28.170029	2014-04-05 20:52:28.170029
414	17	2026	130	2014-04-05 20:52:28.174066	2014-04-05 20:52:28.174066
415	17	2027	130	2014-04-05 20:52:28.177463	2014-04-05 20:52:28.177463
416	17	2028	130	2014-04-05 20:52:28.181107	2014-04-05 20:52:28.181107
417	17	2029	130	2014-04-05 20:52:28.184786	2014-04-05 20:52:28.184786
418	17	2030	130	2014-04-05 20:52:28.188685	2014-04-05 20:52:28.188685
419	17	2031	130	2014-04-05 20:52:28.192247	2014-04-05 20:52:28.192247
420	17	2032	130	2014-04-05 20:52:28.195671	2014-04-05 20:52:28.195671
421	17	2033	130	2014-04-05 20:52:28.199306	2014-04-05 20:52:28.199306
422	17	2034	130	2014-04-05 20:52:28.203014	2014-04-05 20:52:28.203014
423	17	2035	130	2014-04-05 20:52:28.206845	2014-04-05 20:52:28.206845
424	17	2036	130	2014-04-05 20:52:28.210691	2014-04-05 20:52:28.210691
425	17	2037	130	2014-04-05 20:52:28.214281	2014-04-05 20:52:28.214281
426	17	2038	130	2014-04-05 20:52:28.217887	2014-04-05 20:52:28.217887
427	17	2039	130	2014-04-05 20:52:28.221632	2014-04-05 20:52:28.221632
428	17	2040	130	2014-04-05 20:52:28.225348	2014-04-05 20:52:28.225348
429	17	2041	130	2014-04-05 20:52:28.229149	2014-04-05 20:52:28.229149
430	17	2042	130	2014-04-05 20:52:28.232744	2014-04-05 20:52:28.232744
431	17	2043	130	2014-04-05 20:52:28.236177	2014-04-05 20:52:28.236177
432	17	2044	130	2014-04-05 20:52:28.239615	2014-04-05 20:52:28.239615
433	17	2045	130	2014-04-05 20:52:28.243073	2014-04-05 20:52:28.243073
434	17	2046	130	2014-04-05 20:52:28.246722	2014-04-05 20:52:28.246722
435	17	2047	130	2014-04-05 20:52:28.249934	2014-04-05 20:52:28.249934
436	17	2048	130	2014-04-05 20:52:28.253133	2014-04-05 20:52:28.253133
437	17	2049	130	2014-04-05 20:52:28.25692	2014-04-05 20:52:28.25692
438	17	2050	130	2014-04-05 20:52:28.260323	2014-04-05 20:52:28.260323
439	17	2051	130	2014-04-05 20:52:28.263984	2014-04-05 20:52:28.263984
440	17	2052	130	2014-04-05 20:52:28.267422	2014-04-05 20:52:28.267422
441	17	2053	130	2014-04-05 20:52:28.271169	2014-04-05 20:52:28.271169
442	17	2054	130	2014-04-05 20:52:28.274734	2014-04-05 20:52:28.274734
443	17	2055	130	2014-04-05 20:52:28.27826	2014-04-05 20:52:28.27826
444	17	2056	130	2014-04-05 20:52:28.281952	2014-04-05 20:52:28.281952
445	17	2057	130	2014-04-05 20:52:28.285497	2014-04-05 20:52:28.285497
446	17	2058	130	2014-04-05 20:52:28.288932	2014-04-05 20:52:28.288932
447	17	2059	130	2014-04-05 20:52:28.292559	2014-04-05 20:52:28.292559
448	17	2060	130	2014-04-05 20:52:28.295951	2014-04-05 20:52:28.295951
449	17	2061	130	2014-04-05 20:52:28.299495	2014-04-05 20:52:28.299495
450	17	2062	130	2014-04-05 20:52:28.302824	2014-04-05 20:52:28.302824
451	3	2013	130	2014-04-05 20:52:28.30636	2014-04-05 20:52:28.30636
452	3	2014	130	2014-04-05 20:52:28.309664	2014-04-05 20:52:28.309664
453	3	2015	130	2014-04-05 20:52:28.313212	2014-04-05 20:52:28.313212
454	3	2016	130	2014-04-05 20:52:28.316909	2014-04-05 20:52:28.316909
455	3	2017	130	2014-04-05 20:52:28.320152	2014-04-05 20:52:28.320152
456	3	2018	130	2014-04-05 20:52:28.323645	2014-04-05 20:52:28.323645
457	3	2019	130	2014-04-05 20:52:28.327159	2014-04-05 20:52:28.327159
458	3	2020	130	2014-04-05 20:52:28.330615	2014-04-05 20:52:28.330615
459	3	2021	130	2014-04-05 20:52:28.334122	2014-04-05 20:52:28.334122
460	3	2022	130	2014-04-05 20:52:28.337581	2014-04-05 20:52:28.337581
461	3	2023	130	2014-04-05 20:52:28.341168	2014-04-05 20:52:28.341168
462	3	2024	130	2014-04-05 20:52:28.344802	2014-04-05 20:52:28.344802
463	3	2025	130	2014-04-05 20:52:28.348658	2014-04-05 20:52:28.348658
464	3	2026	130	2014-04-05 20:52:28.35245	2014-04-05 20:52:28.35245
465	3	2027	130	2014-04-05 20:52:28.356102	2014-04-05 20:52:28.356102
466	3	2028	130	2014-04-05 20:52:28.359752	2014-04-05 20:52:28.359752
467	3	2029	130	2014-04-05 20:52:28.363224	2014-04-05 20:52:28.363224
468	3	2030	130	2014-04-05 20:52:28.367065	2014-04-05 20:52:28.367065
469	3	2031	130	2014-04-05 20:52:28.370675	2014-04-05 20:52:28.370675
470	3	2032	130	2014-04-05 20:52:28.374234	2014-04-05 20:52:28.374234
471	3	2033	130	2014-04-05 20:52:28.378204	2014-04-05 20:52:28.378204
472	3	2034	130	2014-04-05 20:52:28.381898	2014-04-05 20:52:28.381898
473	3	2035	130	2014-04-05 20:52:28.385702	2014-04-05 20:52:28.385702
474	3	2036	130	2014-04-05 20:52:28.388888	2014-04-05 20:52:28.388888
475	3	2037	130	2014-04-05 20:52:28.392366	2014-04-05 20:52:28.392366
476	3	2038	130	2014-04-05 20:52:28.396071	2014-04-05 20:52:28.396071
477	3	2039	130	2014-04-05 20:52:28.399879	2014-04-05 20:52:28.399879
478	3	2040	130	2014-04-05 20:52:28.404143	2014-04-05 20:52:28.404143
479	3	2041	130	2014-04-05 20:52:28.407888	2014-04-05 20:52:28.407888
480	3	2042	130	2014-04-05 20:52:28.410867	2014-04-05 20:52:28.410867
481	3	2043	130	2014-04-05 20:52:28.413853	2014-04-05 20:52:28.413853
482	3	2044	130	2014-04-05 20:52:28.416976	2014-04-05 20:52:28.416976
483	3	2045	130	2014-04-05 20:52:28.420091	2014-04-05 20:52:28.420091
484	3	2046	130	2014-04-05 20:52:28.423323	2014-04-05 20:52:28.423323
485	3	2047	130	2014-04-05 20:52:28.426755	2014-04-05 20:52:28.426755
486	3	2048	130	2014-04-05 20:52:28.429834	2014-04-05 20:52:28.429834
487	3	2049	130	2014-04-05 20:52:28.432731	2014-04-05 20:52:28.432731
488	3	2050	130	2014-04-05 20:52:28.435705	2014-04-05 20:52:28.435705
489	3	2051	130	2014-04-05 20:52:28.438963	2014-04-05 20:52:28.438963
490	3	2052	130	2014-04-05 20:52:28.442263	2014-04-05 20:52:28.442263
491	3	2053	130	2014-04-05 20:52:28.445242	2014-04-05 20:52:28.445242
492	3	2054	130	2014-04-05 20:52:28.448233	2014-04-05 20:52:28.448233
493	3	2055	130	2014-04-05 20:52:28.451021	2014-04-05 20:52:28.451021
494	3	2056	130	2014-04-05 20:52:28.453771	2014-04-05 20:52:28.453771
495	3	2057	130	2014-04-05 20:52:28.456647	2014-04-05 20:52:28.456647
496	3	2058	130	2014-04-05 20:52:28.459602	2014-04-05 20:52:28.459602
497	3	2059	130	2014-04-05 20:52:28.46262	2014-04-05 20:52:28.46262
498	3	2060	130	2014-04-05 20:52:28.465544	2014-04-05 20:52:28.465544
499	3	2061	130	2014-04-05 20:52:28.473835	2014-04-05 20:52:28.473835
500	3	2062	130	2014-04-05 20:52:28.477006	2014-04-05 20:52:28.477006
501	4	2013	130	2014-04-05 20:52:28.479921	2014-04-05 20:52:28.479921
502	4	2014	130	2014-04-05 20:52:28.482717	2014-04-05 20:52:28.482717
503	4	2015	130	2014-04-05 20:52:28.485599	2014-04-05 20:52:28.485599
504	4	2016	130	2014-04-05 20:52:28.488497	2014-04-05 20:52:28.488497
505	4	2017	130	2014-04-05 20:52:28.491325	2014-04-05 20:52:28.491325
506	4	2018	130	2014-04-05 20:52:28.494244	2014-04-05 20:52:28.494244
507	4	2019	130	2014-04-05 20:52:28.49717	2014-04-05 20:52:28.49717
508	4	2020	130	2014-04-05 20:52:28.500245	2014-04-05 20:52:28.500245
509	4	2021	130	2014-04-05 20:52:28.503196	2014-04-05 20:52:28.503196
510	4	2022	130	2014-04-05 20:52:28.50621	2014-04-05 20:52:28.50621
511	4	2023	130	2014-04-05 20:52:28.509318	2014-04-05 20:52:28.509318
512	4	2024	130	2014-04-05 20:52:28.5126	2014-04-05 20:52:28.5126
513	4	2025	130	2014-04-05 20:52:28.515595	2014-04-05 20:52:28.515595
514	4	2026	130	2014-04-05 20:52:28.518601	2014-04-05 20:52:28.518601
515	4	2027	130	2014-04-05 20:52:28.521902	2014-04-05 20:52:28.521902
516	4	2028	130	2014-04-05 20:52:28.524855	2014-04-05 20:52:28.524855
517	4	2029	130	2014-04-05 20:52:28.527699	2014-04-05 20:52:28.527699
518	4	2030	130	2014-04-05 20:52:28.530572	2014-04-05 20:52:28.530572
519	4	2031	130	2014-04-05 20:52:28.533573	2014-04-05 20:52:28.533573
520	4	2032	130	2014-04-05 20:52:28.536534	2014-04-05 20:52:28.536534
521	4	2033	130	2014-04-05 20:52:28.539542	2014-04-05 20:52:28.539542
522	4	2034	130	2014-04-05 20:52:28.542648	2014-04-05 20:52:28.542648
523	4	2035	130	2014-04-05 20:52:28.545475	2014-04-05 20:52:28.545475
524	4	2036	130	2014-04-05 20:52:28.548511	2014-04-05 20:52:28.548511
525	4	2037	130	2014-04-05 20:52:28.551522	2014-04-05 20:52:28.551522
526	4	2038	130	2014-04-05 20:52:28.554393	2014-04-05 20:52:28.554393
527	4	2039	130	2014-04-05 20:52:28.557033	2014-04-05 20:52:28.557033
528	4	2040	130	2014-04-05 20:52:28.559936	2014-04-05 20:52:28.559936
529	4	2041	130	2014-04-05 20:52:28.562758	2014-04-05 20:52:28.562758
530	4	2042	130	2014-04-05 20:52:28.565392	2014-04-05 20:52:28.565392
531	4	2043	130	2014-04-05 20:52:28.568248	2014-04-05 20:52:28.568248
532	4	2044	130	2014-04-05 20:52:28.570879	2014-04-05 20:52:28.570879
533	4	2045	130	2014-04-05 20:52:28.573519	2014-04-05 20:52:28.573519
534	4	2046	130	2014-04-05 20:52:28.575931	2014-04-05 20:52:28.575931
535	4	2047	130	2014-04-05 20:52:28.578491	2014-04-05 20:52:28.578491
536	4	2048	130	2014-04-05 20:52:28.616534	2014-04-05 20:52:28.616534
537	4	2049	130	2014-04-05 20:52:28.622935	2014-04-05 20:52:28.622935
538	4	2050	130	2014-04-05 20:52:28.625511	2014-04-05 20:52:28.625511
539	4	2051	130	2014-04-05 20:52:28.628087	2014-04-05 20:52:28.628087
540	4	2052	130	2014-04-05 20:52:28.630693	2014-04-05 20:52:28.630693
541	4	2053	130	2014-04-05 20:52:28.633285	2014-04-05 20:52:28.633285
542	4	2054	130	2014-04-05 20:52:28.635734	2014-04-05 20:52:28.635734
543	4	2055	130	2014-04-05 20:52:28.638283	2014-04-05 20:52:28.638283
544	4	2056	130	2014-04-05 20:52:28.640998	2014-04-05 20:52:28.640998
545	4	2057	130	2014-04-05 20:52:28.643763	2014-04-05 20:52:28.643763
546	4	2058	130	2014-04-05 20:52:28.646422	2014-04-05 20:52:28.646422
547	4	2059	130	2014-04-05 20:52:28.649085	2014-04-05 20:52:28.649085
548	4	2060	130	2014-04-05 20:52:28.651618	2014-04-05 20:52:28.651618
549	4	2061	130	2014-04-05 20:52:28.654108	2014-04-05 20:52:28.654108
550	4	2062	130	2014-04-05 20:52:28.656871	2014-04-05 20:52:28.656871
551	5	2013	130	2014-04-05 20:52:28.65961	2014-04-05 20:52:28.65961
552	5	2014	130	2014-04-05 20:52:28.662355	2014-04-05 20:52:28.662355
553	5	2015	130	2014-04-05 20:52:28.664862	2014-04-05 20:52:28.664862
554	5	2016	130	2014-04-05 20:52:28.667235	2014-04-05 20:52:28.667235
555	5	2017	130	2014-04-05 20:52:28.6699	2014-04-05 20:52:28.6699
556	5	2018	130	2014-04-05 20:52:28.673258	2014-04-05 20:52:28.673258
557	5	2019	130	2014-04-05 20:52:28.675749	2014-04-05 20:52:28.675749
558	5	2020	130	2014-04-05 20:52:28.678268	2014-04-05 20:52:28.678268
559	5	2021	130	2014-04-05 20:52:28.680893	2014-04-05 20:52:28.680893
560	5	2022	130	2014-04-05 20:52:28.683396	2014-04-05 20:52:28.683396
561	5	2023	130	2014-04-05 20:52:28.685825	2014-04-05 20:52:28.685825
562	5	2024	130	2014-04-05 20:52:28.688207	2014-04-05 20:52:28.688207
563	5	2025	130	2014-04-05 20:52:28.690576	2014-04-05 20:52:28.690576
564	5	2026	130	2014-04-05 20:52:28.692963	2014-04-05 20:52:28.692963
565	5	2027	130	2014-04-05 20:52:28.695416	2014-04-05 20:52:28.695416
566	5	2028	130	2014-04-05 20:52:28.697812	2014-04-05 20:52:28.697812
567	5	2029	130	2014-04-05 20:52:28.700588	2014-04-05 20:52:28.700588
568	5	2030	130	2014-04-05 20:52:28.702983	2014-04-05 20:52:28.702983
569	5	2031	130	2014-04-05 20:52:28.705595	2014-04-05 20:52:28.705595
570	5	2032	130	2014-04-05 20:52:28.708025	2014-04-05 20:52:28.708025
571	5	2033	130	2014-04-05 20:52:28.710481	2014-04-05 20:52:28.710481
572	5	2034	130	2014-04-05 20:52:28.71299	2014-04-05 20:52:28.71299
573	5	2035	130	2014-04-05 20:52:28.715371	2014-04-05 20:52:28.715371
574	5	2036	130	2014-04-05 20:52:28.717998	2014-04-05 20:52:28.717998
575	5	2037	130	2014-04-05 20:52:28.720425	2014-04-05 20:52:28.720425
576	5	2038	130	2014-04-05 20:52:28.722765	2014-04-05 20:52:28.722765
577	5	2039	130	2014-04-05 20:52:28.725151	2014-04-05 20:52:28.725151
578	5	2040	130	2014-04-05 20:52:28.7275	2014-04-05 20:52:28.7275
579	5	2041	130	2014-04-05 20:52:28.729875	2014-04-05 20:52:28.729875
580	5	2042	130	2014-04-05 20:52:28.73231	2014-04-05 20:52:28.73231
581	5	2043	130	2014-04-05 20:52:28.734752	2014-04-05 20:52:28.734752
582	5	2044	130	2014-04-05 20:52:28.737266	2014-04-05 20:52:28.737266
583	5	2045	130	2014-04-05 20:52:28.739697	2014-04-05 20:52:28.739697
584	5	2046	130	2014-04-05 20:52:28.742178	2014-04-05 20:52:28.742178
585	5	2047	130	2014-04-05 20:52:28.744576	2014-04-05 20:52:28.744576
586	5	2048	130	2014-04-05 20:52:28.746934	2014-04-05 20:52:28.746934
587	5	2049	130	2014-04-05 20:52:28.749321	2014-04-05 20:52:28.749321
588	5	2050	130	2014-04-05 20:52:28.751669	2014-04-05 20:52:28.751669
589	5	2051	130	2014-04-05 20:52:28.75403	2014-04-05 20:52:28.75403
590	5	2052	130	2014-04-05 20:52:28.756373	2014-04-05 20:52:28.756373
591	5	2053	130	2014-04-05 20:52:28.758725	2014-04-05 20:52:28.758725
592	5	2054	130	2014-04-05 20:52:28.761085	2014-04-05 20:52:28.761085
593	5	2055	130	2014-04-05 20:52:28.76344	2014-04-05 20:52:28.76344
594	5	2056	130	2014-04-05 20:52:28.765824	2014-04-05 20:52:28.765824
595	5	2057	130	2014-04-05 20:52:28.768158	2014-04-05 20:52:28.768158
596	5	2058	130	2014-04-05 20:52:28.773141	2014-04-05 20:52:28.773141
597	5	2059	130	2014-04-05 20:52:28.77565	2014-04-05 20:52:28.77565
598	5	2060	130	2014-04-05 20:52:28.778076	2014-04-05 20:52:28.778076
599	5	2061	130	2014-04-05 20:52:28.780527	2014-04-05 20:52:28.780527
600	5	2062	130	2014-04-05 20:52:28.78297	2014-04-05 20:52:28.78297
601	10	2013	130	2014-04-05 20:52:28.785408	2014-04-05 20:52:28.785408
602	10	2014	130	2014-04-05 20:52:28.78789	2014-04-05 20:52:28.78789
603	10	2015	130	2014-04-05 20:52:28.790384	2014-04-05 20:52:28.790384
604	10	2016	130	2014-04-05 20:52:28.792787	2014-04-05 20:52:28.792787
605	10	2017	130	2014-04-05 20:52:28.795164	2014-04-05 20:52:28.795164
606	10	2018	130	2014-04-05 20:52:28.797645	2014-04-05 20:52:28.797645
607	10	2019	130	2014-04-05 20:52:28.800111	2014-04-05 20:52:28.800111
608	10	2020	130	2014-04-05 20:52:28.802587	2014-04-05 20:52:28.802587
609	10	2021	130	2014-04-05 20:52:28.804966	2014-04-05 20:52:28.804966
610	10	2022	130	2014-04-05 20:52:28.807311	2014-04-05 20:52:28.807311
611	10	2023	130	2014-04-05 20:52:28.809723	2014-04-05 20:52:28.809723
612	10	2024	130	2014-04-05 20:52:28.812208	2014-04-05 20:52:28.812208
613	10	2025	130	2014-04-05 20:52:28.814743	2014-04-05 20:52:28.814743
614	10	2026	130	2014-04-05 20:52:28.817164	2014-04-05 20:52:28.817164
615	10	2027	130	2014-04-05 20:52:28.819527	2014-04-05 20:52:28.819527
616	10	2028	130	2014-04-05 20:52:28.821902	2014-04-05 20:52:28.821902
617	10	2029	130	2014-04-05 20:52:28.824275	2014-04-05 20:52:28.824275
618	10	2030	130	2014-04-05 20:52:28.826629	2014-04-05 20:52:28.826629
619	10	2031	130	2014-04-05 20:52:28.828998	2014-04-05 20:52:28.828998
620	10	2032	130	2014-04-05 20:52:28.831314	2014-04-05 20:52:28.831314
621	10	2033	130	2014-04-05 20:52:28.83382	2014-04-05 20:52:28.83382
622	10	2034	130	2014-04-05 20:52:28.836191	2014-04-05 20:52:28.836191
623	10	2035	130	2014-04-05 20:52:28.838532	2014-04-05 20:52:28.838532
624	10	2036	130	2014-04-05 20:52:28.840904	2014-04-05 20:52:28.840904
625	10	2037	130	2014-04-05 20:52:28.843212	2014-04-05 20:52:28.843212
626	10	2038	130	2014-04-05 20:52:28.84561	2014-04-05 20:52:28.84561
627	10	2039	130	2014-04-05 20:52:28.848013	2014-04-05 20:52:28.848013
628	10	2040	130	2014-04-05 20:52:28.850467	2014-04-05 20:52:28.850467
629	10	2041	130	2014-04-05 20:52:28.852834	2014-04-05 20:52:28.852834
630	10	2042	130	2014-04-05 20:52:28.855158	2014-04-05 20:52:28.855158
631	10	2043	130	2014-04-05 20:52:28.857632	2014-04-05 20:52:28.857632
632	10	2044	130	2014-04-05 20:52:28.859983	2014-04-05 20:52:28.859983
633	10	2045	130	2014-04-05 20:52:28.862317	2014-04-05 20:52:28.862317
634	10	2046	130	2014-04-05 20:52:28.864728	2014-04-05 20:52:28.864728
635	10	2047	130	2014-04-05 20:52:28.867157	2014-04-05 20:52:28.867157
636	10	2048	130	2014-04-05 20:52:28.86991	2014-04-05 20:52:28.86991
637	10	2049	130	2014-04-05 20:52:28.873145	2014-04-05 20:52:28.873145
638	10	2050	130	2014-04-05 20:52:28.87561	2014-04-05 20:52:28.87561
639	10	2051	130	2014-04-05 20:52:28.878038	2014-04-05 20:52:28.878038
640	10	2052	130	2014-04-05 20:52:28.880444	2014-04-05 20:52:28.880444
641	10	2053	130	2014-04-05 20:52:28.882871	2014-04-05 20:52:28.882871
642	10	2054	130	2014-04-05 20:52:28.88528	2014-04-05 20:52:28.88528
643	10	2055	130	2014-04-05 20:52:28.887676	2014-04-05 20:52:28.887676
644	10	2056	130	2014-04-05 20:52:28.890048	2014-04-05 20:52:28.890048
645	10	2057	130	2014-04-05 20:52:28.892431	2014-04-05 20:52:28.892431
646	10	2058	130	2014-04-05 20:52:28.89478	2014-04-05 20:52:28.89478
647	10	2059	130	2014-04-05 20:52:28.897145	2014-04-05 20:52:28.897145
648	10	2060	130	2014-04-05 20:52:28.899521	2014-04-05 20:52:28.899521
649	10	2061	130	2014-04-05 20:52:28.901899	2014-04-05 20:52:28.901899
650	10	2062	130	2014-04-05 20:52:28.90424	2014-04-05 20:52:28.90424
651	2	2013	130	2014-04-05 20:52:28.906618	2014-04-05 20:52:28.906618
652	2	2014	130	2014-04-05 20:52:28.908991	2014-04-05 20:52:28.908991
653	2	2015	130	2014-04-05 20:52:28.911367	2014-04-05 20:52:28.911367
654	2	2016	130	2014-04-05 20:52:28.913763	2014-04-05 20:52:28.913763
655	2	2017	130	2014-04-05 20:52:28.916121	2014-04-05 20:52:28.916121
656	2	2018	130	2014-04-05 20:52:28.918485	2014-04-05 20:52:28.918485
657	2	2019	130	2014-04-05 20:52:28.920864	2014-04-05 20:52:28.920864
658	2	2020	130	2014-04-05 20:52:28.923252	2014-04-05 20:52:28.923252
659	2	2021	130	2014-04-05 20:52:28.92573	2014-04-05 20:52:28.92573
660	2	2022	130	2014-04-05 20:52:28.928199	2014-04-05 20:52:28.928199
661	2	2023	130	2014-04-05 20:52:28.930657	2014-04-05 20:52:28.930657
662	2	2024	130	2014-04-05 20:52:28.933063	2014-04-05 20:52:28.933063
663	2	2025	130	2014-04-05 20:52:28.935501	2014-04-05 20:52:28.935501
664	2	2026	130	2014-04-05 20:52:28.937846	2014-04-05 20:52:28.937846
665	2	2027	130	2014-04-05 20:52:28.940208	2014-04-05 20:52:28.940208
666	2	2028	130	2014-04-05 20:52:28.942585	2014-04-05 20:52:28.942585
667	2	2029	130	2014-04-05 20:52:28.944961	2014-04-05 20:52:28.944961
668	2	2030	130	2014-04-05 20:52:28.947481	2014-04-05 20:52:28.947481
669	2	2031	130	2014-04-05 20:52:28.951636	2014-04-05 20:52:28.951636
670	2	2032	130	2014-04-05 20:52:28.954336	2014-04-05 20:52:28.954336
671	2	2033	130	2014-04-05 20:52:28.956836	2014-04-05 20:52:28.956836
672	2	2034	130	2014-04-05 20:52:28.959401	2014-04-05 20:52:28.959401
673	2	2035	130	2014-04-05 20:52:28.961883	2014-04-05 20:52:28.961883
674	2	2036	130	2014-04-05 20:52:28.964267	2014-04-05 20:52:28.964267
675	2	2037	130	2014-04-05 20:52:28.966664	2014-04-05 20:52:28.966664
676	2	2038	130	2014-04-05 20:52:28.96902	2014-04-05 20:52:28.96902
677	2	2039	130	2014-04-05 20:52:28.971344	2014-04-05 20:52:28.971344
678	2	2040	130	2014-04-05 20:52:28.973733	2014-04-05 20:52:28.973733
679	2	2041	130	2014-04-05 20:52:28.976198	2014-04-05 20:52:28.976198
680	2	2042	130	2014-04-05 20:52:28.978609	2014-04-05 20:52:28.978609
681	2	2043	130	2014-04-05 20:52:28.981023	2014-04-05 20:52:28.981023
682	2	2044	130	2014-04-05 20:52:28.984288	2014-04-05 20:52:28.984288
683	2	2045	130	2014-04-05 20:52:28.987155	2014-04-05 20:52:28.987155
684	2	2046	130	2014-04-05 20:52:28.989634	2014-04-05 20:52:28.989634
685	2	2047	130	2014-04-05 20:52:28.992058	2014-04-05 20:52:28.992058
686	2	2048	130	2014-04-05 20:52:28.994492	2014-04-05 20:52:28.994492
687	2	2049	130	2014-04-05 20:52:28.99709	2014-04-05 20:52:28.99709
688	2	2050	130	2014-04-05 20:52:28.999663	2014-04-05 20:52:28.999663
689	2	2051	130	2014-04-05 20:52:29.002468	2014-04-05 20:52:29.002468
690	2	2052	130	2014-04-05 20:52:29.005177	2014-04-05 20:52:29.005177
691	2	2053	130	2014-04-05 20:52:29.007817	2014-04-05 20:52:29.007817
692	2	2054	130	2014-04-05 20:52:29.010363	2014-04-05 20:52:29.010363
693	2	2055	130	2014-04-05 20:52:29.013079	2014-04-05 20:52:29.013079
694	2	2056	130	2014-04-05 20:52:29.015624	2014-04-05 20:52:29.015624
695	2	2057	130	2014-04-05 20:52:29.018256	2014-04-05 20:52:29.018256
696	2	2058	130	2014-04-05 20:52:29.020918	2014-04-05 20:52:29.020918
697	2	2059	130	2014-04-05 20:52:29.023373	2014-04-05 20:52:29.023373
698	2	2060	130	2014-04-05 20:52:29.025844	2014-04-05 20:52:29.025844
699	2	2061	130	2014-04-05 20:52:29.028267	2014-04-05 20:52:29.028267
700	2	2062	130	2014-04-05 20:52:29.030799	2014-04-05 20:52:29.030799
701	16	2013	130	2014-04-05 20:52:29.033262	2014-04-05 20:52:29.033262
702	16	2014	130	2014-04-05 20:52:29.035639	2014-04-05 20:52:29.035639
703	16	2015	130	2014-04-05 20:52:29.038028	2014-04-05 20:52:29.038028
704	16	2016	130	2014-04-05 20:52:29.04051	2014-04-05 20:52:29.04051
705	16	2017	130	2014-04-05 20:52:29.042877	2014-04-05 20:52:29.042877
706	16	2018	130	2014-04-05 20:52:29.045288	2014-04-05 20:52:29.045288
707	16	2019	130	2014-04-05 20:52:29.047693	2014-04-05 20:52:29.047693
708	16	2020	130	2014-04-05 20:52:29.05018	2014-04-05 20:52:29.05018
709	16	2021	130	2014-04-05 20:52:29.052981	2014-04-05 20:52:29.052981
710	16	2022	130	2014-04-05 20:52:29.055328	2014-04-05 20:52:29.055328
711	16	2023	130	2014-04-05 20:52:29.057727	2014-04-05 20:52:29.057727
712	16	2024	130	2014-04-05 20:52:29.060127	2014-04-05 20:52:29.060127
713	16	2025	130	2014-04-05 20:52:29.062753	2014-04-05 20:52:29.062753
714	16	2026	130	2014-04-05 20:52:29.065123	2014-04-05 20:52:29.065123
715	16	2027	130	2014-04-05 20:52:29.067574	2014-04-05 20:52:29.067574
716	16	2028	130	2014-04-05 20:52:29.069924	2014-04-05 20:52:29.069924
717	16	2029	130	2014-04-05 20:52:29.072862	2014-04-05 20:52:29.072862
718	16	2030	130	2014-04-05 20:52:29.075176	2014-04-05 20:52:29.075176
719	16	2031	130	2014-04-05 20:52:29.077583	2014-04-05 20:52:29.077583
720	16	2032	130	2014-04-05 20:52:29.07996	2014-04-05 20:52:29.07996
721	16	2033	130	2014-04-05 20:52:29.082437	2014-04-05 20:52:29.082437
722	16	2034	130	2014-04-05 20:52:29.084807	2014-04-05 20:52:29.084807
723	16	2035	130	2014-04-05 20:52:29.087199	2014-04-05 20:52:29.087199
724	16	2036	130	2014-04-05 20:52:29.089661	2014-04-05 20:52:29.089661
725	16	2037	130	2014-04-05 20:52:29.092141	2014-04-05 20:52:29.092141
726	16	2038	130	2014-04-05 20:52:29.09468	2014-04-05 20:52:29.09468
727	16	2039	130	2014-04-05 20:52:29.097254	2014-04-05 20:52:29.097254
728	16	2040	130	2014-04-05 20:52:29.099817	2014-04-05 20:52:29.099817
729	16	2041	130	2014-04-05 20:52:29.10242	2014-04-05 20:52:29.10242
730	16	2042	130	2014-04-05 20:52:29.104955	2014-04-05 20:52:29.104955
731	16	2043	130	2014-04-05 20:52:29.107465	2014-04-05 20:52:29.107465
732	16	2044	130	2014-04-05 20:52:29.110025	2014-04-05 20:52:29.110025
733	16	2045	130	2014-04-05 20:52:29.112497	2014-04-05 20:52:29.112497
734	16	2046	130	2014-04-05 20:52:29.114878	2014-04-05 20:52:29.114878
735	16	2047	130	2014-04-05 20:52:29.117347	2014-04-05 20:52:29.117347
736	16	2048	130	2014-04-05 20:52:29.119764	2014-04-05 20:52:29.119764
737	16	2049	130	2014-04-05 20:52:29.122146	2014-04-05 20:52:29.122146
738	16	2050	130	2014-04-05 20:52:29.12454	2014-04-05 20:52:29.12454
739	16	2051	130	2014-04-05 20:52:29.126913	2014-04-05 20:52:29.126913
740	16	2052	130	2014-04-05 20:52:29.129462	2014-04-05 20:52:29.129462
741	16	2053	130	2014-04-05 20:52:29.131936	2014-04-05 20:52:29.131936
742	16	2054	130	2014-04-05 20:52:29.134455	2014-04-05 20:52:29.134455
743	16	2055	130	2014-04-05 20:52:29.137039	2014-04-05 20:52:29.137039
744	16	2056	130	2014-04-05 20:52:29.139779	2014-04-05 20:52:29.139779
745	16	2057	130	2014-04-05 20:52:29.14251	2014-04-05 20:52:29.14251
746	16	2058	130	2014-04-05 20:52:29.145066	2014-04-05 20:52:29.145066
747	16	2059	130	2014-04-05 20:52:29.147747	2014-04-05 20:52:29.147747
748	16	2060	130	2014-04-05 20:52:29.150381	2014-04-05 20:52:29.150381
749	16	2061	130	2014-04-05 20:52:29.15291	2014-04-05 20:52:29.15291
750	16	2062	130	2014-04-05 20:52:29.155427	2014-04-05 20:52:29.155427
751	1	2013	130	2014-04-05 20:52:29.15792	2014-04-05 20:52:29.15792
752	1	2014	130	2014-04-05 20:52:29.160396	2014-04-05 20:52:29.160396
753	1	2015	130	2014-04-05 20:52:29.162855	2014-04-05 20:52:29.162855
754	1	2016	130	2014-04-05 20:52:29.165433	2014-04-05 20:52:29.165433
755	1	2017	130	2014-04-05 20:52:29.167859	2014-04-05 20:52:29.167859
756	1	2018	130	2014-04-05 20:52:29.170351	2014-04-05 20:52:29.170351
757	1	2019	130	2014-04-05 20:52:29.173368	2014-04-05 20:52:29.173368
758	1	2020	130	2014-04-05 20:52:29.17582	2014-04-05 20:52:29.17582
759	1	2021	130	2014-04-05 20:52:29.178314	2014-04-05 20:52:29.178314
760	1	2022	130	2014-04-05 20:52:29.180751	2014-04-05 20:52:29.180751
761	1	2023	130	2014-04-05 20:52:29.183134	2014-04-05 20:52:29.183134
762	1	2024	130	2014-04-05 20:52:29.185572	2014-04-05 20:52:29.185572
763	1	2025	130	2014-04-05 20:52:29.188014	2014-04-05 20:52:29.188014
764	1	2026	130	2014-04-05 20:52:29.190453	2014-04-05 20:52:29.190453
765	1	2027	130	2014-04-05 20:52:29.192924	2014-04-05 20:52:29.192924
766	1	2028	130	2014-04-05 20:52:29.195354	2014-04-05 20:52:29.195354
767	1	2029	130	2014-04-05 20:52:29.197813	2014-04-05 20:52:29.197813
768	1	2030	130	2014-04-05 20:52:29.200246	2014-04-05 20:52:29.200246
769	1	2031	130	2014-04-05 20:52:29.202655	2014-04-05 20:52:29.202655
770	1	2032	130	2014-04-05 20:52:29.205072	2014-04-05 20:52:29.205072
771	1	2033	130	2014-04-05 20:52:29.207562	2014-04-05 20:52:29.207562
772	1	2034	130	2014-04-05 20:52:29.209976	2014-04-05 20:52:29.209976
773	1	2035	130	2014-04-05 20:52:29.212459	2014-04-05 20:52:29.212459
774	1	2036	130	2014-04-05 20:52:29.214857	2014-04-05 20:52:29.214857
775	1	2037	130	2014-04-05 20:52:29.217342	2014-04-05 20:52:29.217342
776	1	2038	130	2014-04-05 20:52:29.21972	2014-04-05 20:52:29.21972
777	1	2039	130	2014-04-05 20:52:29.222059	2014-04-05 20:52:29.222059
778	1	2040	130	2014-04-05 20:52:29.224423	2014-04-05 20:52:29.224423
779	1	2041	130	2014-04-05 20:52:29.226875	2014-04-05 20:52:29.226875
780	1	2042	130	2014-04-05 20:52:29.229543	2014-04-05 20:52:29.229543
781	1	2043	130	2014-04-05 20:52:29.232048	2014-04-05 20:52:29.232048
782	1	2044	130	2014-04-05 20:52:29.234566	2014-04-05 20:52:29.234566
783	1	2045	130	2014-04-05 20:52:29.237052	2014-04-05 20:52:29.237052
784	1	2046	130	2014-04-05 20:52:29.239618	2014-04-05 20:52:29.239618
785	1	2047	130	2014-04-05 20:52:29.242104	2014-04-05 20:52:29.242104
786	1	2048	130	2014-04-05 20:52:29.244623	2014-04-05 20:52:29.244623
787	1	2049	130	2014-04-05 20:52:29.24701	2014-04-05 20:52:29.24701
788	1	2050	130	2014-04-05 20:52:29.249435	2014-04-05 20:52:29.249435
789	1	2051	130	2014-04-05 20:52:29.251923	2014-04-05 20:52:29.251923
790	1	2052	130	2014-04-05 20:52:29.254428	2014-04-05 20:52:29.254428
791	1	2053	130	2014-04-05 20:52:29.256902	2014-04-05 20:52:29.256902
792	1	2054	130	2014-04-05 20:52:29.259247	2014-04-05 20:52:29.259247
793	1	2055	130	2014-04-05 20:52:29.261664	2014-04-05 20:52:29.261664
794	1	2056	130	2014-04-05 20:52:29.264053	2014-04-05 20:52:29.264053
795	1	2057	130	2014-04-05 20:52:29.266565	2014-04-05 20:52:29.266565
796	1	2058	130	2014-04-05 20:52:29.268994	2014-04-05 20:52:29.268994
797	1	2059	130	2014-04-05 20:52:29.271488	2014-04-05 20:52:29.271488
798	1	2060	130	2014-04-05 20:52:29.273924	2014-04-05 20:52:29.273924
799	1	2061	130	2014-04-05 20:52:29.276355	2014-04-05 20:52:29.276355
800	1	2062	130	2014-04-05 20:52:29.278793	2014-04-05 20:52:29.278793
801	6	2013	130	2014-04-05 20:52:29.281209	2014-04-05 20:52:29.281209
803	6	2015	130	2014-04-05 20:52:29.286124	2014-04-05 20:52:29.286124
804	6	2016	130	2014-04-05 20:52:29.288616	2014-04-05 20:52:29.288616
805	6	2017	130	2014-04-05 20:52:29.291092	2014-04-05 20:52:29.291092
806	6	2018	130	2014-04-05 20:52:29.293658	2014-04-05 20:52:29.293658
807	6	2019	130	2014-04-05 20:52:29.296191	2014-04-05 20:52:29.296191
808	6	2020	130	2014-04-05 20:52:29.298791	2014-04-05 20:52:29.298791
809	6	2021	130	2014-04-05 20:52:29.301222	2014-04-05 20:52:29.301222
810	6	2022	130	2014-04-05 20:52:29.303601	2014-04-05 20:52:29.303601
811	6	2023	130	2014-04-05 20:52:29.306061	2014-04-05 20:52:29.306061
812	6	2024	130	2014-04-05 20:52:29.308515	2014-04-05 20:52:29.308515
813	6	2025	130	2014-04-05 20:52:29.311257	2014-04-05 20:52:29.311257
814	6	2026	130	2014-04-05 20:52:29.313823	2014-04-05 20:52:29.313823
815	6	2027	130	2014-04-05 20:52:29.316392	2014-04-05 20:52:29.316392
816	6	2028	130	2014-04-05 20:52:29.318929	2014-04-05 20:52:29.318929
817	6	2029	130	2014-04-05 20:52:29.321358	2014-04-05 20:52:29.321358
818	6	2030	130	2014-04-05 20:52:29.323862	2014-04-05 20:52:29.323862
819	6	2031	130	2014-04-05 20:52:29.326291	2014-04-05 20:52:29.326291
820	6	2032	130	2014-04-05 20:52:29.328686	2014-04-05 20:52:29.328686
821	6	2033	130	2014-04-05 20:52:29.331026	2014-04-05 20:52:29.331026
822	6	2034	130	2014-04-05 20:52:29.33348	2014-04-05 20:52:29.33348
823	6	2035	130	2014-04-05 20:52:29.335983	2014-04-05 20:52:29.335983
824	6	2036	130	2014-04-05 20:52:29.338401	2014-04-05 20:52:29.338401
825	6	2037	130	2014-04-05 20:52:29.363241	2014-04-05 20:52:29.363241
826	6	2038	130	2014-04-05 20:52:29.366246	2014-04-05 20:52:29.366246
827	6	2039	130	2014-04-05 20:52:29.369124	2014-04-05 20:52:29.369124
828	6	2040	130	2014-04-05 20:52:29.373444	2014-04-05 20:52:29.373444
829	6	2041	130	2014-04-05 20:52:29.376426	2014-04-05 20:52:29.376426
830	6	2042	130	2014-04-05 20:52:29.379305	2014-04-05 20:52:29.379305
831	6	2043	130	2014-04-05 20:52:29.382209	2014-04-05 20:52:29.382209
832	6	2044	130	2014-04-05 20:52:29.385103	2014-04-05 20:52:29.385103
833	6	2045	130	2014-04-05 20:52:29.387717	2014-04-05 20:52:29.387717
834	6	2046	130	2014-04-05 20:52:29.390661	2014-04-05 20:52:29.390661
835	6	2047	130	2014-04-05 20:52:29.39369	2014-04-05 20:52:29.39369
836	6	2048	130	2014-04-05 20:52:29.396678	2014-04-05 20:52:29.396678
837	6	2049	130	2014-04-05 20:52:29.39958	2014-04-05 20:52:29.39958
838	6	2050	130	2014-04-05 20:52:29.403368	2014-04-05 20:52:29.403368
839	6	2051	130	2014-04-05 20:52:29.406326	2014-04-05 20:52:29.406326
840	6	2052	130	2014-04-05 20:52:29.409301	2014-04-05 20:52:29.409301
841	6	2053	130	2014-04-05 20:52:29.412236	2014-04-05 20:52:29.412236
842	6	2054	130	2014-04-05 20:52:29.41518	2014-04-05 20:52:29.41518
843	6	2055	130	2014-04-05 20:52:29.41837	2014-04-05 20:52:29.41837
844	6	2056	130	2014-04-05 20:52:29.421446	2014-04-05 20:52:29.421446
845	6	2057	130	2014-04-05 20:52:29.424228	2014-04-05 20:52:29.424228
846	6	2058	130	2014-04-05 20:52:29.427096	2014-04-05 20:52:29.427096
847	6	2059	130	2014-04-05 20:52:29.430113	2014-04-05 20:52:29.430113
848	6	2060	130	2014-04-05 20:52:29.43316	2014-04-05 20:52:29.43316
849	6	2061	130	2014-04-05 20:52:29.436404	2014-04-05 20:52:29.436404
850	6	2062	130	2014-04-05 20:52:29.439635	2014-04-05 20:52:29.439635
802	6	2014	130	2014-04-05 20:52:29.28366	2014-09-04 21:47:11.289568
\.


--
-- Name: budgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('budgets_id_seq', 850, true);


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contracts (id, player_id, contract_start_year, contract_length, is_bought_out, bought_out_by_team_id, is_extended, is_franchised, created_at, updated_at, is_dead_money, is_drafted, is_longterm_deal) FROM stdin;
1	245	2011	5	\N	\N	\N	\N	2014-01-10 20:07:44.861625	2014-01-10 20:07:44.861625	\N	t	\N
3	222	2011	6	\N	\N	\N	\N	2014-01-10 22:36:44.885002	2014-01-10 22:36:44.885002	\N	t	\N
69	133	2013	2	f	\N	t	f	2014-01-11 01:28:26.800631	2014-08-01 03:42:25.706932	\N	t	\N
6	91	2013	3	\N	\N	\N	\N	2014-01-10 22:41:13.424121	2014-01-10 22:41:13.424121	\N	t	\N
7	16	2013	2	\N	\N	\N	\N	2014-01-10 22:43:16.000601	2014-01-10 22:43:16.000601	\N	t	\N
8	306	2011	5	\N	\N	\N	\N	2014-01-10 22:45:30.698276	2014-01-10 22:45:30.698276	\N	t	\N
10	233	2011	5	\N	\N	\N	\N	2014-01-10 22:48:58.758999	2014-01-10 22:48:58.758999	\N	t	\N
11	294	2011	5	\N	\N	\N	\N	2014-01-10 22:50:12.658811	2014-01-10 22:50:12.658811	\N	t	\N
12	274	2012	2	f	\N	t	f	2014-01-10 22:50:53.849374	2014-01-10 22:51:03.125381	f	t	\N
13	1	2013	2	\N	\N	\N	\N	2014-01-10 22:52:20.645396	2014-01-10 22:52:20.645396	\N	t	\N
15	150	2013	3	\N	\N	\N	\N	2014-01-10 22:53:32.467565	2014-01-10 22:53:32.467565	\N	t	\N
16	337	2011	5	\N	\N	\N	\N	2014-01-10 22:54:19.08656	2014-01-10 22:54:19.08656	\N	t	\N
17	86	2013	4	\N	\N	\N	\N	2014-01-10 22:55:15.987215	2014-01-10 22:55:15.987215	\N	t	\N
19	299	2011	4	\N	\N	\N	\N	2014-01-10 22:58:53.884862	2014-01-10 22:58:53.884862	\N	t	\N
22	313	2013	2	\N	\N	\N	\N	2014-01-10 23:01:40.786026	2014-01-10 23:01:40.786026	\N	t	\N
23	268	2011	4	\N	\N	\N	\N	2014-01-10 23:03:45.570559	2014-01-10 23:03:45.570559	\N	t	\N
24	226	2012	3	\N	\N	\N	\N	2014-01-10 23:04:47.479186	2014-01-10 23:04:47.479186	\N	t	\N
25	318	2013	3	f	\N	f	f	2014-01-10 23:06:39.484781	2014-01-10 23:06:58.027877	f	t	\N
27	312	2012	5	\N	\N	\N	\N	2014-01-10 23:46:58.100579	2014-01-10 23:46:58.100579	\N	t	\N
28	291	2012	4	\N	\N	\N	\N	2014-01-10 23:48:21.407276	2014-01-10 23:48:21.407276	\N	t	\N
29	32	2013	5	\N	\N	\N	\N	2014-01-10 23:48:57.42742	2014-01-10 23:48:57.42742	\N	t	\N
30	80	2013	3	\N	\N	\N	\N	2014-01-10 23:50:43.430127	2014-01-10 23:50:43.430127	\N	t	\N
31	3	2013	4	\N	\N	\N	\N	2014-01-10 23:51:20.749299	2014-01-10 23:51:20.749299	\N	t	\N
32	93	2013	6	\N	\N	\N	\N	2014-01-10 23:51:56.978609	2014-01-10 23:51:56.978609	\N	t	\N
33	285	2011	5	\N	\N	\N	\N	2014-01-11 00:15:21.445781	2014-01-11 00:15:21.445781	\N	t	\N
81	296	2013	1	f	\N	f	t	2014-08-01 03:43:20.838819	2014-08-01 03:43:26.607961	\N	t	\N
35	251	2012	3	\N	\N	\N	\N	2014-01-11 00:25:39.822194	2014-01-11 00:25:39.822194	\N	t	\N
36	82	2013	4	\N	\N	\N	\N	2014-01-11 00:27:00.864446	2014-01-11 00:27:00.864446	\N	t	\N
37	71	2013	5	\N	\N	\N	\N	2014-01-11 00:27:29.932562	2014-01-11 00:27:29.932562	\N	t	\N
38	100	2013	5	\N	\N	\N	\N	2014-01-11 00:27:53.724346	2014-01-11 00:27:53.724346	\N	t	\N
39	25	2013	3	\N	\N	\N	\N	2014-01-11 00:28:20.008485	2014-01-11 00:28:20.008485	\N	t	\N
40	94	2013	5	\N	\N	\N	\N	2014-01-11 00:28:51.792257	2014-01-11 00:28:51.792257	\N	t	\N
41	290	2013	5	f	\N	f	f	2014-01-11 00:29:27.75815	2014-01-11 00:29:55.566832	f	t	\N
42	327	2013	2	\N	\N	\N	\N	2014-01-11 00:37:16.056898	2014-01-11 00:37:16.056898	\N	t	\N
43	219	2012	2	f	\N	t	f	2014-01-11 00:37:55.47071	2014-01-11 00:38:04.198538	f	t	\N
44	321	2011	4	\N	\N	\N	\N	2014-01-11 00:40:28.489603	2014-01-11 00:40:28.489603	\N	t	\N
45	300	2013	2	\N	\N	\N	\N	2014-01-11 00:41:07.0053	2014-01-11 00:41:07.0053	\N	t	\N
46	14	2013	2	\N	\N	\N	\N	2014-01-11 00:43:43.169709	2014-01-11 00:43:43.169709	\N	t	\N
47	102	2013	2	\N	\N	\N	\N	2014-01-11 00:44:27.851659	2014-01-11 00:44:27.851659	\N	t	\N
48	232	2012	3	\N	\N	\N	\N	2014-01-11 00:49:40.924886	2014-01-11 00:49:40.924886	\N	t	\N
49	243	2013	3	\N	\N	\N	\N	2014-01-11 00:50:10.906861	2014-01-11 00:50:10.906861	\N	t	\N
50	79	2013	3	\N	\N	\N	\N	2014-01-11 01:03:21.158901	2014-01-11 01:03:21.158901	\N	t	\N
51	2	2013	3	\N	\N	\N	\N	2014-01-11 01:04:08.844209	2014-01-11 01:04:08.844209	\N	t	\N
53	73	2013	2	\N	\N	\N	\N	2014-01-11 01:05:03.778587	2014-01-11 01:05:03.778587	\N	t	\N
54	242	2012	3	f	\N	f	f	2014-01-11 01:06:22.108604	2014-01-11 01:06:30.760327	f	t	\N
55	329	2012	5	\N	\N	\N	\N	2014-01-11 01:16:17.710528	2014-01-11 01:16:17.710528	\N	t	\N
56	258	2013	2	\N	\N	\N	\N	2014-01-11 01:16:49.727644	2014-01-11 01:16:49.727644	\N	t	\N
57	254	2013	3	\N	\N	\N	\N	2014-01-11 01:17:33.418645	2014-01-11 01:17:33.418645	\N	t	\N
58	308	2013	2	\N	\N	\N	\N	2014-01-11 01:18:37.480076	2014-01-11 01:18:37.480076	\N	t	\N
59	137	2013	2	\N	\N	\N	\N	2014-01-11 01:19:53.950522	2014-01-11 01:19:53.950522	\N	t	\N
61	238	2012	3	\N	\N	\N	\N	2014-01-11 01:21:19.59353	2014-01-11 01:21:19.59353	\N	t	\N
62	311	2013	3	\N	\N	\N	\N	2014-01-11 01:22:00.193728	2014-01-11 01:22:00.193728	\N	t	\N
67	270	2013	2	t	3	f	f	2014-01-11 01:27:17.036884	2014-08-01 15:18:46.448447	\N	t	\N
64	145	2013	4	\N	\N	\N	\N	2014-01-11 01:23:46.120802	2014-01-11 01:23:46.120802	\N	t	\N
65	275	2011	4	\N	\N	\N	\N	2014-01-11 01:26:04.196449	2014-01-11 01:26:04.196449	\N	t	\N
66	260	2013	2	\N	\N	\N	\N	2014-01-11 01:26:37.45039	2014-01-11 01:26:37.45039	\N	t	\N
70	107	2013	3	\N	\N	\N	\N	2014-01-11 01:28:56.100891	2014-01-11 01:28:56.100891	\N	t	\N
71	252	2011	4	f	\N	t	f	2014-01-11 04:03:54.172772	2014-01-11 04:04:04.749044	f	t	\N
5	304	2011	4	t	10	f	f	2014-01-10 22:39:46.629408	2014-08-01 15:21:07.50235	\N	t	\N
73	271	2012	3	t	10	f	f	2014-01-16 00:40:07.728318	2014-01-16 00:40:21.049696	f	t	\N
26	255	2011	6	f	\N	f	f	2014-01-10 23:46:01.612984	2014-08-01 15:21:52.958129	\N	t	\N
75	223	2012	11	\N	\N	\N	\N	2014-01-16 00:51:03.905007	2014-01-16 00:51:03.905007	\N	t	\N
74	63	2011	4	t	1	f	f	2014-01-16 00:42:39.521352	2014-02-09 03:44:03.591814	f	t	\N
76	99	2013	5	\N	\N	\N	\N	2014-02-09 03:53:20.990603	2014-02-09 03:53:20.990603	\N	t	\N
20	250	2012	2	f	\N	t	f	2014-01-10 23:00:10.725207	2014-05-25 05:53:43.17911	f	t	\N
77	292	2013	1	f	\N	f	t	2014-08-01 03:32:29.498565	2014-08-01 03:32:57.772804	\N	t	\N
14	301	2011	4	f	\N	t	f	2014-01-10 22:53:08.996353	2014-08-01 03:33:54.601443	\N	t	\N
78	267	2013	1	f	\N	f	t	2014-08-01 03:34:35.053032	2014-08-01 03:34:59.191197	\N	t	\N
21	33	2013	2	f	\N	t	f	2014-01-10 23:00:55.885968	2014-08-01 03:36:02.105415	\N	t	\N
52	287	2012	3	f	\N	t	f	2014-01-11 01:04:41.504858	2014-08-01 03:38:57.781069	\N	t	\N
79	297	2013	1	f	\N	f	t	2014-08-01 03:39:38.660593	2014-08-01 03:39:46.340567	\N	t	\N
60	129	2013	2	f	\N	t	f	2014-01-11 01:20:19.789324	2014-08-01 03:40:24.272347	\N	t	\N
63	316	2012	2	t	6	t	f	2014-01-11 01:23:07.63685	2014-08-01 03:41:01.824793	f	t	\N
80	339	2013	1	f	\N	f	t	2014-08-01 03:41:35.158737	2014-08-01 03:41:45.234438	\N	t	\N
82	262	2012	2	f	\N	f	t	2014-08-02 20:33:47.06377	2014-08-02 20:34:08.466261	\N	t	\N
83	5	2013	2	f	\N	f	f	2014-08-02 20:43:10.942186	2014-08-02 20:43:22.347394	\N	t	\N
84	279	2013	2	f	\N	f	f	2014-08-02 20:44:18.279415	2014-08-02 20:44:30.671439	\N	t	\N
85	42	2014	1	\N	\N	\N	\N	2014-08-28 01:10:34.174057	2014-08-28 01:10:34.174057	\N	t	\N
86	138	2014	1	\N	\N	\N	\N	2014-08-28 01:10:48.537418	2014-08-28 01:10:48.537418	\N	t	\N
87	340	2014	1	\N	\N	\N	\N	2014-08-28 01:11:42.439045	2014-08-28 01:11:42.439045	\N	t	\N
88	363	2014	1	\N	\N	\N	\N	2014-08-28 01:12:01.219199	2014-08-28 01:12:01.219199	\N	t	\N
89	330	2014	1	\N	\N	\N	\N	2014-08-28 01:12:18.911134	2014-08-28 01:12:18.911134	\N	t	\N
90	355	2014	1	\N	\N	\N	\N	2014-08-28 01:12:39.118252	2014-08-28 01:12:39.118252	\N	t	\N
91	41	2014	1	\N	\N	\N	\N	2014-08-28 01:12:55.223545	2014-08-28 01:12:55.223545	\N	t	\N
92	26	2014	1	\N	\N	\N	\N	2014-09-02 03:18:42.711486	2014-09-02 03:18:42.711486	\N	t	\N
93	278	2014	1	\N	\N	\N	\N	2014-09-02 03:21:11.762203	2014-09-02 03:21:11.762203	\N	t	\N
94	103	2014	1	\N	\N	\N	\N	2014-09-02 03:21:39.203669	2014-09-02 03:21:39.203669	\N	t	\N
95	265	2014	1	\N	\N	\N	\N	2014-09-02 22:27:16.86556	2014-09-02 22:27:16.86556	\N	t	\N
96	27	2014	1	\N	\N	\N	\N	2014-09-02 22:28:58.297786	2014-09-02 22:28:58.297786	\N	t	\N
97	266	2014	1	\N	\N	\N	\N	2014-09-02 22:39:22.537144	2014-09-02 22:39:22.537144	\N	t	\N
98	29	2014	1	\N	\N	\N	\N	2014-09-02 22:39:56.04471	2014-09-02 22:39:56.04471	\N	t	\N
99	364	2014	1	\N	\N	\N	\N	2014-09-02 22:42:12.037818	2014-09-02 22:42:12.037818	\N	t	\N
100	244	2014	1	\N	\N	\N	\N	2014-09-02 22:42:53.688546	2014-09-02 22:42:53.688546	\N	t	\N
101	241	2014	1	\N	\N	\N	\N	2014-09-02 22:43:24.872311	2014-09-02 22:43:24.872311	\N	t	\N
102	130	2014	1	\N	\N	\N	\N	2014-09-02 22:43:48.502311	2014-09-02 22:43:48.502311	\N	t	\N
103	317	2014	1	\N	\N	\N	\N	2014-09-02 22:44:08.25803	2014-09-02 22:44:08.25803	\N	t	\N
104	328	2014	1	\N	\N	\N	\N	2014-09-02 22:44:37.488344	2014-09-02 22:44:37.488344	\N	t	\N
105	68	2014	1	\N	\N	\N	\N	2014-09-02 22:44:58.874259	2014-09-02 22:44:58.874259	\N	t	\N
106	333	2014	1	\N	\N	\N	\N	2014-09-02 22:45:37.261478	2014-09-02 22:45:37.261478	\N	t	\N
107	350	2014	1	\N	\N	\N	\N	2014-09-02 22:45:53.231258	2014-09-02 22:45:53.231258	\N	t	\N
108	122	2014	1	\N	\N	\N	\N	2014-09-02 22:46:25.346814	2014-09-02 22:46:25.346814	\N	t	\N
109	191	2014	1	\N	\N	\N	\N	2014-09-02 22:46:49.417965	2014-09-02 22:46:49.417965	\N	t	\N
110	182	2014	1	\N	\N	\N	\N	2014-09-02 22:47:07.758364	2014-09-02 22:47:07.758364	\N	t	\N
111	141	2014	1	\N	\N	\N	\N	2014-09-02 22:47:28.26159	2014-09-02 22:47:28.26159	\N	t	\N
112	264	2014	1	\N	\N	\N	\N	2014-09-02 22:47:44.61374	2014-09-02 22:47:44.61374	\N	t	\N
113	307	2014	1	\N	\N	\N	\N	2014-09-02 22:48:01.872296	2014-09-02 22:48:01.872296	\N	t	\N
114	352	2014	1	\N	\N	\N	\N	2014-09-02 22:48:18.11859	2014-09-02 22:48:18.11859	\N	t	\N
115	362	2014	1	\N	\N	\N	\N	2014-09-02 22:55:12.088357	2014-09-02 22:55:12.088357	\N	t	\N
116	359	2014	1	\N	\N	\N	\N	2014-09-02 22:56:15.896169	2014-09-02 22:56:15.896169	\N	t	\N
117	367	2014	1	\N	\N	\N	\N	2014-09-02 22:56:40.904376	2014-09-02 22:56:40.904376	\N	t	\N
118	210	2014	1	\N	\N	\N	\N	2014-09-02 22:57:05.798222	2014-09-02 22:57:05.798222	\N	t	\N
119	197	2014	1	\N	\N	\N	\N	2014-09-02 22:57:52.187665	2014-09-02 22:57:52.187665	\N	t	\N
120	17	2014	1	\N	\N	\N	\N	2014-09-03 01:07:43.188429	2014-09-03 01:07:43.188429	\N	t	\N
121	346	2014	1	\N	\N	\N	\N	2014-09-03 01:08:03.542171	2014-09-03 01:08:03.542171	\N	t	\N
122	158	2014	1	\N	\N	\N	\N	2014-09-03 01:08:37.83713	2014-09-03 01:08:37.83713	\N	t	\N
123	44	2014	1	\N	\N	\N	\N	2014-09-03 01:10:01.142253	2014-09-03 01:10:01.142253	\N	t	\N
124	249	2014	1	\N	\N	\N	\N	2014-09-03 01:10:17.356669	2014-09-03 01:10:17.356669	\N	t	\N
125	6	2014	1	\N	\N	\N	\N	2014-09-03 01:11:04.138383	2014-09-03 01:11:04.138383	\N	t	\N
126	365	2014	1	\N	\N	\N	\N	2014-09-03 01:11:21.895559	2014-09-03 01:11:21.895559	\N	t	\N
127	123	2014	1	\N	\N	\N	\N	2014-09-03 01:11:37.562533	2014-09-03 01:11:37.562533	\N	t	\N
128	69	2014	1	\N	\N	\N	\N	2014-09-03 01:12:45.128155	2014-09-03 01:12:45.128155	\N	t	\N
129	43	2014	1	\N	\N	\N	\N	2014-09-03 01:13:07.969333	2014-09-03 01:13:07.969333	\N	t	\N
130	125	2014	1	\N	\N	\N	\N	2014-09-03 01:13:49.248483	2014-09-03 01:13:49.248483	\N	t	\N
131	7	2014	1	\N	\N	\N	\N	2014-09-03 01:14:02.80513	2014-09-03 01:14:02.80513	\N	t	\N
132	181	2014	1	\N	\N	\N	\N	2014-09-03 01:14:16.339616	2014-09-03 01:14:16.339616	\N	t	\N
133	58	2014	1	\N	\N	\N	\N	2014-09-03 01:15:09.752744	2014-09-03 01:15:09.752744	\N	t	\N
134	237	2014	1	\N	\N	\N	\N	2014-09-03 01:15:42.87357	2014-09-03 01:15:42.87357	\N	t	\N
135	101	2014	1	\N	\N	\N	\N	2014-09-03 01:15:59.948333	2014-09-03 01:15:59.948333	\N	t	\N
136	134	2014	1	\N	\N	\N	\N	2014-09-03 01:20:49.797931	2014-09-03 01:20:49.797931	\N	t	\N
137	189	2014	1	\N	\N	\N	\N	2014-09-03 01:21:20.159237	2014-09-03 01:21:20.159237	\N	t	\N
138	162	2014	1	\N	\N	\N	\N	2014-09-03 01:27:57.118627	2014-09-03 01:27:57.118627	\N	t	\N
139	81	2014	1	\N	\N	\N	\N	2014-09-03 01:28:16.282709	2014-09-03 01:28:16.282709	\N	t	\N
140	344	2014	1	\N	\N	\N	\N	2014-09-03 01:33:44.725693	2014-09-03 01:33:44.725693	\N	t	\N
141	353	2014	1	\N	\N	\N	\N	2014-09-03 01:33:57.792845	2014-09-03 01:33:57.792845	\N	t	\N
142	196	2014	1	\N	\N	\N	\N	2014-09-03 01:34:14.445843	2014-09-03 01:34:14.445843	\N	t	\N
143	23	2014	1	\N	\N	\N	\N	2014-09-03 01:34:34.617989	2014-09-03 01:34:34.617989	\N	t	\N
144	83	2014	1	\N	\N	\N	\N	2014-09-03 01:35:12.500588	2014-09-03 01:35:12.500588	\N	t	\N
145	11	2014	1	\N	\N	\N	\N	2014-09-03 01:35:25.411686	2014-09-03 01:35:25.411686	\N	t	\N
146	161	2014	1	\N	\N	\N	\N	2014-09-03 01:35:38.967216	2014-09-03 01:35:38.967216	\N	t	\N
147	295	2014	1	\N	\N	\N	\N	2014-09-03 01:42:01.248044	2014-09-03 01:42:01.248044	\N	t	\N
148	24	2014	1	\N	\N	\N	\N	2014-09-03 01:42:15.959283	2014-09-03 01:42:15.959283	\N	t	\N
149	377	2014	1	\N	\N	\N	\N	2014-09-03 01:47:44.572502	2014-09-03 01:47:44.572502	\N	t	\N
150	378	2014	1	\N	\N	\N	\N	2014-09-03 01:48:28.444251	2014-09-03 01:48:28.444251	\N	t	\N
151	208	2014	1	\N	\N	\N	\N	2014-09-03 01:49:57.000553	2014-09-03 01:49:57.000553	\N	t	\N
152	379	2014	1	\N	\N	\N	\N	2014-09-03 01:54:37.838248	2014-09-03 01:54:37.838248	\N	t	\N
153	227	2014	1	\N	\N	\N	\N	2014-09-03 01:55:15.360487	2014-09-03 01:55:15.360487	\N	t	\N
154	204	2014	1	\N	\N	\N	\N	2014-09-03 01:56:04.575834	2014-09-03 01:56:04.575834	\N	t	\N
155	289	2014	1	\N	\N	\N	\N	2014-09-03 01:56:20.303447	2014-09-03 01:56:20.303447	\N	t	\N
156	47	2014	1	\N	\N	\N	\N	2014-09-03 01:56:38.283386	2014-09-03 01:56:38.283386	\N	t	\N
157	157	2014	1	\N	\N	\N	\N	2014-09-03 01:56:49.912027	2014-09-03 01:56:49.912027	\N	t	\N
158	281	2014	1	\N	\N	\N	\N	2014-09-03 01:56:59.413192	2014-09-03 01:56:59.413192	\N	t	\N
159	341	2014	1	\N	\N	\N	\N	2014-09-03 01:57:16.571633	2014-09-03 01:57:16.571633	\N	t	\N
160	190	2014	1	\N	\N	\N	\N	2014-09-03 01:57:27.964655	2014-09-03 01:57:27.964655	\N	t	\N
161	171	2014	1	\N	\N	\N	\N	2014-09-03 01:57:48.169142	2014-09-03 01:57:48.169142	\N	t	\N
162	40	2014	1	\N	\N	\N	\N	2014-09-03 01:58:05.208112	2014-09-03 01:58:05.208112	\N	t	\N
163	139	2014	1	\N	\N	\N	\N	2014-09-03 01:58:17.434212	2014-09-03 01:58:17.434212	\N	t	\N
164	338	2014	1	\N	\N	\N	\N	2014-09-03 01:58:48.899251	2014-09-03 01:58:48.899251	\N	t	\N
165	220	2014	1	\N	\N	\N	\N	2014-09-03 02:00:31.625335	2014-09-03 02:00:31.625335	\N	t	\N
166	273	2014	1	\N	\N	\N	\N	2014-09-03 02:00:44.807838	2014-09-03 02:00:44.807838	\N	t	\N
167	324	2014	1	\N	\N	\N	\N	2014-09-03 02:12:10.461827	2014-09-03 02:12:10.461827	\N	t	\N
168	34	2014	1	\N	\N	\N	\N	2014-09-03 02:12:30.938366	2014-09-03 02:12:30.938366	\N	t	\N
169	354	2014	1	\N	\N	\N	\N	2014-09-03 02:13:05.423038	2014-09-03 02:13:05.423038	\N	t	\N
170	309	2014	1	\N	\N	\N	\N	2014-09-03 02:13:18.116474	2014-09-03 02:13:18.116474	\N	t	\N
171	167	2014	1	\N	\N	\N	\N	2014-09-03 02:15:03.56142	2014-09-03 02:15:03.56142	\N	t	\N
172	30	2014	1	\N	\N	\N	\N	2014-09-03 02:15:58.307012	2014-09-03 02:15:58.307012	\N	t	\N
173	305	2014	1	\N	\N	\N	\N	2014-09-03 02:16:42.608175	2014-09-03 02:16:42.608175	\N	t	\N
174	380	2014	1	\N	\N	\N	\N	2014-09-03 02:18:03.16401	2014-09-03 02:18:03.16401	\N	f	\N
175	343	2014	1	\N	\N	\N	\N	2014-09-03 02:18:36.228887	2014-09-03 02:18:36.228887	\N	t	\N
176	361	2014	1	\N	\N	\N	\N	2014-09-03 02:19:06.802284	2014-09-03 02:19:06.802284	\N	t	\N
177	87	2014	1	\N	\N	\N	\N	2014-09-03 02:19:17.727522	2014-09-03 02:19:17.727522	\N	t	\N
178	276	2014	1	\N	\N	\N	\N	2014-09-03 02:19:28.706001	2014-09-03 02:19:28.706001	\N	t	\N
179	381	2014	1	\N	\N	\N	\N	2014-09-03 02:20:25.058832	2014-09-03 02:20:25.058832	\N	t	\N
180	201	2014	1	\N	\N	\N	\N	2014-09-03 02:22:32.296916	2014-09-03 02:22:32.296916	\N	t	\N
181	12	2014	1	\N	\N	\N	\N	2014-09-03 02:22:47.132686	2014-09-03 02:22:47.132686	\N	t	\N
182	166	2014	1	\N	\N	\N	\N	2014-09-03 02:23:00.476654	2014-09-03 02:23:00.476654	\N	t	\N
183	120	2014	1	\N	\N	\N	\N	2014-09-03 02:24:15.659735	2014-09-03 02:24:15.659735	\N	t	\N
184	336	2014	1	\N	\N	\N	\N	2014-09-03 02:24:29.391203	2014-09-03 02:24:29.391203	\N	t	\N
185	39	2014	1	\N	\N	\N	\N	2014-09-03 02:24:37.742671	2014-09-03 02:24:37.742671	\N	t	\N
186	284	2014	1	\N	\N	\N	\N	2014-09-03 02:25:10.293833	2014-09-03 02:25:10.293833	\N	t	\N
187	4	2014	1	\N	\N	\N	\N	2014-09-03 02:25:26.32795	2014-09-03 02:25:26.32795	\N	t	\N
188	13	2014	1	\N	\N	\N	\N	2014-09-03 02:25:36.94632	2014-09-03 02:25:36.94632	\N	t	\N
189	192	2014	1	\N	\N	\N	\N	2014-09-03 02:25:51.564386	2014-09-03 02:25:51.564386	\N	t	\N
190	314	2014	1	\N	\N	\N	\N	2014-09-03 02:26:00.227358	2014-09-03 02:26:00.227358	\N	t	\N
191	213	2014	1	\N	\N	\N	\N	2014-09-03 02:26:11.306757	2014-09-03 02:26:11.306757	\N	t	\N
192	95	2014	1	\N	\N	\N	\N	2014-09-03 02:26:26.026756	2014-09-03 02:26:26.026756	\N	t	\N
193	357	2014	1	\N	\N	\N	\N	2014-09-03 02:27:06.872107	2014-09-03 02:27:06.872107	\N	t	\N
194	97	2014	1	\N	\N	\N	\N	2014-09-03 02:27:40.321701	2014-09-03 02:27:40.321701	\N	t	\N
195	224	2014	1	\N	\N	\N	\N	2014-09-03 02:27:49.96157	2014-09-03 02:27:49.96157	\N	t	\N
196	218	2014	1	\N	\N	\N	\N	2014-09-03 02:28:05.088708	2014-09-03 02:28:05.088708	\N	t	\N
197	147	2014	1	\N	\N	\N	\N	2014-09-03 02:28:16.531542	2014-09-03 02:28:16.531542	\N	t	\N
9	38	2014	1	t	2	f	f	2014-01-10 22:47:20.297973	2014-09-03 02:28:59.429348	\N	t	\N
198	253	2014	1	\N	\N	\N	\N	2014-09-03 02:29:16.534444	2014-09-03 02:29:16.534444	\N	t	\N
199	160	2014	1	\N	\N	\N	\N	2014-09-03 02:29:27.224201	2014-09-03 02:29:27.224201	\N	t	\N
200	38	2014	1	\N	\N	\N	\N	2014-09-03 02:30:22.406804	2014-09-03 02:30:22.406804	\N	t	\N
201	225	2014	1	\N	\N	\N	\N	2014-09-03 02:31:17.242054	2014-09-03 02:31:17.242054	\N	t	\N
202	348	2014	1	\N	\N	\N	\N	2014-09-03 02:31:32.640463	2014-09-03 02:31:32.640463	\N	t	\N
203	366	2014	1	\N	\N	\N	\N	2014-09-03 02:31:47.659271	2014-09-03 02:31:47.659271	\N	t	\N
204	345	2014	1	\N	\N	\N	\N	2014-09-03 02:31:56.863314	2014-09-03 02:31:56.863314	\N	t	\N
205	209	2014	1	\N	\N	\N	\N	2014-09-03 02:32:06.418103	2014-09-03 02:32:06.418103	\N	t	\N
206	85	2014	1	\N	\N	\N	\N	2014-09-03 02:32:39.093097	2014-09-03 02:32:39.093097	\N	t	\N
207	360	2014	1	\N	\N	\N	\N	2014-09-03 02:33:28.39488	2014-09-03 02:33:28.39488	\N	t	\N
208	382	2014	1	\N	\N	\N	\N	2014-09-03 02:34:41.08578	2014-09-03 02:34:41.08578	\N	t	\N
209	8	2014	1	\N	\N	\N	\N	2014-09-03 02:35:04.339607	2014-09-03 02:35:04.339607	\N	t	\N
210	302	2014	1	\N	\N	\N	\N	2014-09-03 02:35:21.280697	2014-09-03 02:35:21.280697	\N	t	\N
211	383	2014	1	\N	\N	\N	\N	2014-09-03 02:36:22.921097	2014-09-03 02:36:22.921097	\N	f	\N
212	384	2014	1	\N	\N	\N	\N	2014-09-03 02:37:23.374204	2014-09-03 02:37:23.374204	\N	f	\N
214	246	2014	1	\N	\N	\N	\N	2014-09-07 15:59:20.067478	2014-09-07 15:59:20.067478	\N	f	\N
215	217	2014	1	\N	\N	\N	\N	2014-09-09 19:17:06.1428	2014-09-09 19:17:06.1428	\N	t	\N
216	386	2014	1	\N	\N	\N	\N	2014-09-09 19:18:35.691321	2014-09-09 19:18:35.691321	\N	f	\N
217	206	2014	1	\N	\N	\N	\N	2014-09-10 17:41:32.566221	2014-09-10 17:41:32.566221	\N	f	\N
\.


--
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contracts_id_seq', 217, true);


--
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conversations (id, subject, created_at, updated_at) FROM stdin;
1	How's the testing coming along?	2014-05-12 04:25:00.18353	2014-05-12 04:25:00.18353
10	Trade proposal awaiting your approval	2014-06-25 17:55:06.968149	2014-06-25 17:55:06.968149
9	8======D	2014-05-13 21:38:34.918445	2014-07-21 17:18:38.038545
11	Trade proposal awaiting your approval	2014-08-02 16:47:47.869308	2014-08-02 16:47:47.869308
12	Trade proposal awaiting your approval	2014-08-02 18:35:11.581816	2014-08-02 18:35:11.581816
8	How's your testing coming along?	2014-05-12 04:56:08.319157	2014-08-02 18:43:25.39842
13	Trade proposal awaiting your approval	2014-08-12 21:08:08.198048	2014-08-12 21:08:08.198048
14	Trade proposal awaiting your approval	2014-08-13 14:43:01.214633	2014-08-13 14:43:01.214633
15	Trade proposal awaiting your approval	2014-09-04 21:57:06.812567	2014-09-04 21:57:06.812567
\.


--
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('conversations_id_seq', 15, true);


--
-- Data for Name: draft_rosters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY draft_rosters (id, name, team_id, created_at, updated_at) FROM stdin;
2	2014 Draft	1	2014-04-08 15:26:06.657663	2014-04-08 15:26:06.657663
4	test	12	2014-08-02 18:09:57.315529	2014-08-02 18:09:57.315529
5	Watch List	7	2014-08-02 18:30:33.021161	2014-08-02 18:30:33.021161
6	2014	10	2014-08-02 20:45:41.152502	2014-08-02 20:45:41.152502
7	Andrew Tanker	6	2014-09-02 03:18:06.311059	2014-09-02 03:18:06.311059
\.


--
-- Name: draft_rosters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('draft_rosters_id_seq', 7, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events (id, team_id, title, event_date, event_type, description, created_at, updated_at) FROM stdin;
1	1	New season starts	2014-08-01	Global	Prepare for the start of the 2014 season!	2014-04-05 20:46:39.176683	2014-04-05 20:46:39.176683
2	12	Test Event	2014-08-01	Personal	extensions and franchise tags due	2014-04-06 04:03:27.599982	2014-04-06 04:03:27.599982
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_id_seq', 2, true);


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY features (id, title, content, homepage_order, on_homepage, show_title, feature_type, created_at, updated_at, is_published, url_path, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, excerpt, image_classes, highlighted_post, subtitle, category_one_on, category_two_on, category_three_on, category_one_text, category_two_text, category_three_text, category_one_class, category_two_class, category_three_class, user_id) FROM stdin;
6	Long-Term Contracts	Long-term contracts are always an option, but not mandatory. A GM may have all 16 players on one-year contracts, or all 16 players signed to multi-year deals. Keep in mind; a limited player pool will be available to draft on a year-to-year basis.\r\n\t\t\t\t\t\r\nAfter GMs complete the draft, they have six NFL weeks to sign their first-year players to multi-year contracts. All draft picks and free agents begin on one-year contracts and there is no maximum length on the contracts. After each season, a GM has the option to extend a multi-year deal for one additional year one time. However, the extension must be given before the start of the final year of a contract. For instance, if you have Eli Manning (then you are a tool, but anyways...) until 2012, you need to exercise his one- year extension to 2014 before the start of 2012. After the start of the 2012 season you can no longer extend his contract.	3	\N	t	Constitution	2013-09-18 04:39:35.92607	2013-09-18 04:39:35.92607	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
1	Welcome	Version 0.9 of the league site is now live. It's still a little rough around the edges so please bear with it while updates are made on an ongoing basis. \r\n\r\nIt seemed more important to actually get this live than continue waiting for every little feature.	1	\N	t	Announcements	2013-09-18 04:20:21.063479	2013-09-25 01:53:11.329453	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
4	Scoring	The official scoring rules can always be found on the Yahoo! league page and in the FAQ section of this site. At no time during the season will the scoring rules be changed. Offseason scoring changes will be voted on and passed by the league's voting rule detailed below.\n\t\t\t\t\t\nIf any player feels that Yahoo! has scored a play/player/team incorrectly, he may appeal to the commissioner for a scoring adjustment. In the presence of indisputable evidence (at the commissioner's discretion), the score will be adjusted. *REMINDER:* It is up to YOU to notify the commissioner of a scoring error. Do not whine three weeks later if you find out your score was wrong. Scoring may ONLY be changed up until Wednesday after the NFL week has ended. After that, SOL.	1	\N	t	Constitution	2013-09-18 04:38:22.448752	2013-09-28 06:38:34.993081	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
7	Free Agent Player Add/Drops	Again, any and all free agent adds require salary cap money to acquire players and each GM must have 16 players on your rosters AT ALL TIMES. A GM may not spend his $130 on 13 players and have three empty roster spots.\r\n\t\t\t\t\t\r\n*_Free Agent Pickups_*\r\n\t\t\t\t\t\r\nThere will be NO waiver wire for free agents. They are eligible to be picked up AT ANY TIME, however, the option to play them for that week will close on Sundays exactly one hour before the kick of the NFL schedule. Once that time period has passed (usually noon on Sundays, except when Thursday games start), you are eligible to pick up any player, but not play him until the following week. DoPR will run free agency this way to avoid having people that pay no attention during the week, check every Monday and get players due to waiver wire rules. This league is too involved to not allowed instant pick- ups when you see an injury or sub. A picked up player can be signed for as little as $1 off the wire and signed for a maximum amount that a GM has left under his salary cap.\r\n\t\t\r\n*_Added Player Contracts_*\r\n\t\t\t\t\t\r\nPlayers that are picked up during the regular season are only tenured for rest of the season. The following year, they are put up for restricted free agency, a process that will be explained in the next section.\r\n\t\t\t\t\t\r\n*_Dropped Players_*\r\n\t\t\t\t\t\r\nPlayers that are dropped remain against a team's salary cap until another GM picks up the full length of the contract. For instance, if a GM drops Marion Barber with three years left on his contract, all three years will remain against that GM's cap space, in addition to the new salary just taken on by the added player until another GM picks up Barber for the amount and duration of the current contract. A new GM may also choose to pick up a free agent for a partial length of his contract. If he chooses to do so, the previous GM is let off the hook on his cap for as many years as the new GM signs him for.\r\n\t\t\t\t\t\r\nExample: Marion Barber signed by Don for 3 years in 2011 at $10, $13 (2012), $16 (2013) is dropped. If no other GM picks him up for the remaining three years, Don would owe $10 in 2011, $13 in 2012 and $16 in 2013, despite the fact that Marion is sitting on the wire the entire time. If Chris Cornell chooses to pick Marion up in 2011, he would then owe him $10 in 2011 and Don would only be on the hook for $13 in 2012 and $16 in 2013. If Barber then gets drafted by Limpach in 2012, Limpach would owe him $13 for 2012 and Don would only be on the hook for $16 in 2013 and so on.	4	\N	t	Constitution	2013-09-18 04:41:22.398223	2013-09-18 04:41:22.398223	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
8	Restricted Free Agency/Franchise Tagging	Players that are picked up in the regular season are considered restricted free agents. They have a tenured contract for the duration of the season they are picked up and then are available for drafting the following year UNLESS the GM chooses to franchise tag ONE free agent pickup by August 1. Once the August 1 deadline passes, all rosters are cleared of eligible draft agents, NO QUESTIONS ASKED. You had plenty of time to think about their contract. After August 1, a list of all draft-eligible free agents will be sent out, along with every team's current contracts, salary cap restrictions, etc. All league contracts and salary caps will be public since the commissioner can see them and would therefore be at an unfair advantage with the rest of the league.\r\n\t\t\t\t\t\r\n*_Franchise Tagging_*\r\n\t\t\t\t\t\r\nGM's have the option to franchise tag either one player whose contract is expiring at the end of the season OR a free agent picked up during the season. A player may only be franchise tagged one time during his tenure with that GM. A franchised player will earn the average of the top five players at his position per the next year's CBS values if that value is higher than the next step in his contract value would have been. If the average of the top five at his position is lower than the next step in his contract, then he will cost the\t next step in his contract value. Again, only one tag is available per team, per year and a player is only eligible to be tagged once while with his current GM.	5	\N	t	Constitution	2013-09-18 04:42:09.687146	2013-09-18 04:42:09.687146	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
19	When was the first kicker-for-kicker trade in the history of fantasy football transacted?	On October 1, 2013 at approximately 11:30 AM MDT, league member and most likely 2013 season champion at the time given his 4-0 record and all-around amazing team Kyle Kerley and commissioner Andrew Tanker finalized the details of a trade involving Sebastian Janikowski and $11 of cap of the 2013 season to Tanker for Steven Hauschka and Tanker's third-round 2014 draft pick.\n\nHowever, the trade had to be revoked shortly thereafter due to Tanker going over cap by the $1 for Janikowski's salary. It was amended to have the same terms, but Kerley kept Janikowski as dead money until someone else picked him up.	5	\N	t	FAQ	2013-10-01 23:03:53.480376	2013-10-28 19:36:58.779058	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
3	League constitution	All the information contained below is the official constitution of the Disciples of Philip Rivers Fantasy Football League and is the ultimate law of the land. To suggest changes/amendments, please create a poll in the Facebook group.	0	\N	t	Constitution	2013-09-18 04:29:26.420129	2014-02-07 16:08:51.051826	f	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
9	Trading	Trading can be done between GMs and can include players, draft picks, current cap room and future cap room.\r\n\t\t\t\t\t\r\n*_Player-for-Player Trading_*\r\n\t\t\t\t\t\r\nPlayer-for-player trading is very simple and standard rules apply in terms of roster space. However, when trading players, both GMs will also trade the contracts associated with said player. For a trade to be considered applicable, both GMs need to ensure that their future years still remain under the cap. A trade that puts any team over the cap in a present and/or future season will automatically be considered null and void. To save the commissioner time, please thoroughly review both teams' cap space BEFORE accepting the trade. GMs can also trade cap room with players to alleviate a potential salary cap dilemma.\r\n\t\t\t\t\t\r\n*_Player-for-Cap Trading_*\r\n\t\t\t\t\t\r\nIf a GM trades a player for cap room, the GM that traded for that player also takes on the contract. For instance if this trade were to happen between Kyle B. and Gabrel:\r\n\t\t\t\t\t\r\nKyle B. Receives - Eli Manning. Eli's Contract: 2 years at $15 (2012) and $19 (2013) Gabrel Receives - $30 in salary cap in 2012\r\n\t\t\t\t\t\r\nGabrel would then have a salary cap of $160 in 2012 and would also have Eli's contract removed from his payroll (in essence freeing up a total of $45 in cap space in 2012). Kyle B's salary cap would drop to $100 and he would also have to take on the additional $15 of Eli Manning's contract as well as his $19 in his second season...plus the punishment of having Eli Manning on his team for the remainder of the contract.\r\n\t\t\t\t\t\r\np{color:red}. Trades of cap-for-cap are NOT permitted. A player MUST be involved in any trade.\r\n\t\t\t\t\t\r\n*_Trade of Draft Picks_*\r\n\t\t\t\t\t\r\nTeams may also choose to trade players for future draft picks or draft picks for draft picks, but not cap room for draft picks. If a player is traded for a draft pick, again the new GM must be able to take on the full length and salary of his contract, or the trade will be vetoed automatically. Teams may ONLY trade for the following year draft picks. No trading for a sixth round pick in 2026.\r\n\t\t\t\r\n*_Trade Deadline_*\r\n\t\t\t\t\t\r\nThere will be no official trade deadline in the league, except when the league playoffs start. All trades must be completed by Tuesday at 8 a.m. of NFL Week 14.\r\n\t\t\t\t\t\r\nThe Commissioner will review all trades before they are processed to ensure league integrity and that all salary cap rules are followed.\r\n\t\t\t\t\t\r\n*_Retired/Deceased Players_*\r\n\t\t\t\t\t\r\nOnce a player retires or dies, his contract is immediately terminated and any and all years and money you owed him are freed. If said player un-retires, he is placed back into the free agent pool at the CBS set value. The previous contract is still no longer honored.	6	\N	t	Constitution	2013-09-18 04:46:08.656479	2013-09-18 04:46:08.656479	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
10	Playoffs	A total of SIX teams make the playoffs each season. The two division winners will get the first and second seeds (using points for as the tiebreaker for overall record), followed by four wild cards from either division. The first three Wild Card teams chosen will be based on best overall records and the fourth Wild Card slot (sixth seed) will be given to the team not yet qualified with the most overall Points For. The top two seeds receive byes in NFL Week 14 for the Wild Card round, semifinals to take place in NFL Week 15 and the championship in NFL Week 16.	7	\N	t	Constitution	2013-09-18 04:46:53.797907	2013-09-18 04:46:53.797907	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
11	Straight Cash, Homie	League fees will be $100/person in 2011 and will be negotiated upon next season by league vote. LEAGUE FEES ARE DUE BY JULY 15 ANNUALLY. If an owner misses the deadline, a replacement will be found. No excuses, no exceptions.\r\n\t\t\t\t\t\r\n*Money Breakdown*\r\n* League "Super Bowl" Champion: $600 \r\n* Super Bowl runner-up: $300\r\n* Semifinal winner: $100\r\n* Division Winners: $40/each\r\n* Most points during the regular season: $25\r\n* Highest point total weeks 1-13: $5/ea\r\n* Highest weekly point total of the season: $10\r\n* Best trash talker, determined by message board vote in week 13: $10 \r\n* Deadbeat of the year booby prize (worst record): $5\r\n* NFL Super Bowl prediction (total points scored in the Super Bowl as the tiebreaker): $5\r\n\t\t\t\t\t\r\n_Total prize money: $1200_	8	\N	t	Constitution	2013-09-18 04:49:00.835519	2013-09-18 04:49:00.835519	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
12	Non-returning members/Expansion	If a GM chooses not to return he will be publicly tarred and feathered and then the league will need to find a replacement who is willing to take on his team in its entirety. To lessen the disadvantage of picking up a team that isn't his and that will likely have bad contracts, the new GM is permitted to void any and all contracts on his team and may choose to start from scratch at the next draft if he so pleases. A replacement GM will be given the current team of the GM he is replacing and allowed to sign any and all players to long-term contracts without penalty. His draft order will then be decided by the previous GM's record.\r\n\r\n_Expansion_\r\n\t\t\t\t\t\r\nIf the league drops down to 10 teams in any year, expansion can be made to 12 teams the next year or any following year. To accommodate the new GMs, expansion teams will have first choices of draft position and receive either three draft picks before any returning GM begins his draft OR may use any combination of his three picks to choose from a selected pool of unprotected players from the current GMs. Once expansion teams are chosen, current GMs will be given a chance to protect up to six players on his roster that may not be selected by expansion GMs. If an expansion GM chooses to take an unprotected player from an existing team, he must take on the full length and money of his contract. The current GM would then get one of the expansion GMs three compensatory draft picks of free agents before the official draft begins. Once the league reaches 12 GMs, it is at capacity and will no longer take on new GMs until someone drops their team.\r\n\t\t\t\t\t\r\nIf for some reason one of the original 12 GMs becomes a huge jackass or doesn't pay his fees, the league may kick him out of the league with eight votes of 11.	8	\N	f	Constitution	2013-09-18 04:50:06.009747	2013-09-18 04:50:06.009747	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
13	League Rule Changes	The league is constantly evolving and is to be seen as a work in progress. No constitution rules are set in stone and can be amended with a league majority.\r\n\t\t\t\t\t\r\n*_Voting process_*\r\n\t\t\t\t\t\r\nPolls will be placed on the league page on Facebook and must be voted on by the league within one week of its posting. Amendments will be passed automatically with eight votes, or a general consensus if enough voters have not participated.\r\n\t\t\t\t\t\r\nTo ensure we reach the maximum amount of voters, every league vote missed will count as $1 off your current year's salary cap, unless you have a valid reason as to why you cannot participate (vacation, hospital, etc.). If your current cap is maxed out and you lose $1, which puts you over the cap, you must drop/trade a player by the start of the next game or your roster will be ineligible and you will forfeit the week with a total of 0 points.	9	\N	t	Constitution	2013-09-18 04:50:59.401756	2013-09-18 04:50:59.401756	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
14	Frequently Asked Questions	Come here for answers to all the dumb things you keep asking over and over again in the Facebook group, on the Yahoo message boards and/or in league-wide email chains.	0	\N	t	FAQ	2013-09-18 04:52:32.716422	2014-02-07 16:09:01.522382	f	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
17	Why is defense weighted so heavily?	Due to the fact that in real football, defense is half the game, it only makes sense that it's such a huge part of the weekly score. \r\n\r\nDefense makes or breaks a team in real life; it can do the same here.	3	\N	t	FAQ	2013-09-28 06:15:55.624129	2013-10-28 19:37:04.058393	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
5	Draft: Live Draft Format	Each draft in subsequent years will take place on the Sunday of Labor Day weekend, unless circumstances occur to change the date. If you cannot attend the live draft, you MUST be accessible online. If neither of these options are feasible, please contact the commissioner with a damn good excuse and other arrangements.\n\t\t\t\t\t\n*_Draft Structure_*\n\t\t\t\t\t\nBeginning in 2012, the GM with the worst record will have first pick and the league will have an NFL style draft, without snaking. Draft order is determined by regular season worst records, using total points for as the tiebreaker for draft picks Nos. 1-6. Nos. 6-12 are determined by playoff finish, regardless of regular season standings. The Super Bowl champ will always have No. 12, runner up gets No. 11, semifinal losers have Nos. 9 and 10, determined by regular season record, and Wild Card losers get Nos. 7 and 8. Due to long-term contracts, not all GMs will need all 16 rounds of the draft each year. Therefore, once a GM has all 16 spots of his roster filled out, his draft will be concluded and will be skipped every round for the rest of the draft that year.\n\t\t\t\t\t\n*_Cap Room_*\n\t\t\t\t\t\nEach GM begins with *$130 in cap space* and *16 roster spots*. Opening player salaries are to be set by CBS in year one, followed by the attached salary spreadsheet for multi-year contracts. All rookies and free agents will again revert back to the CBS set value of the current season. You can sign a player for as much as $115 and as little as $1. However, you are not AT ANY TIME allowed over your $130 cap limit, unless you have traded for extra cap room. If a GM attempts to trade or pick up a player that would put them over the cap, the commissioner will automatically reject the transaction, no questions asked. All 16 roster spots need to be filled at the end of the draft with any combination of QB, RB, RB, WR, WR, WR/RB TE, K, D. In addition to your 16 roster spots, you will have unlimited IR spots available. The players on IR will still count against your cap and must actually be on the NFL IR to qualify.\n\t\t\t\t\t\n*_Remaining Players_*\n\t\t\t\t\t\nPlayers that go undrafted go into a free agent player pool and can be picked up at anytime. There is a free agent add/drop procedure that needs to be followed and is explained later.	2	\N	t	Constitution	2013-09-18 04:39:07.114794	2013-09-28 06:40:31.163837	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
16	Sitewide updates implemented	A number of minor cosmetic changes have been implemented throughout the site. A change log will be available for all updates that occur after this point.\r\n\r\nOn the "Members" page, user information includes total amount paid out to date. Historical data dating back to the 2011-2012 season has been entered into the system; the only missing information is the NFL Super Bowl prediction winner for the 2011-2012 and 2012-2013 seasons.	2	\N	t	Announcements	2013-09-25 02:13:52.388475	2013-09-25 02:13:52.388475	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
15	What are the league scoring rules?	|_. Offense|_. League value|\r\n|Passing Yards|25 yards per point|\r\n|Passing Touchdowns|6|\r\n|Interceptions|-4|\r\n|Rushing Yards|10 yards per point|\r\n|Rushing Touchdowns|6|\r\n|Receptions|1|\r\n|Reception Yards|10 yards per point||\r\n|Reception Touchdowns|6|\r\n|Return Yards|75 yards per point||\r\n|Return Touchdowns|6|\r\n|2-Point Conversions|2|\r\n|Fumbles Lost|-4|\r\n|Offensive Fumble Return TD |6|\r\n\r\n|_. Kickers|_. League Value|\r\n|Field Goals 0-19 Yards|1|\r\n|Field Goals 20-29 Yards|2|\r\n|Field Goals 30-39 Yards|3|\r\n|Field Goals 40-49 Yards|4|\r\n|Field Goals 50+ Yards|5|\r\n|Field Goals Missed 0-19 Yards|-3|\r\n|Field Goals Missed 20-29 Yards|-2|\r\n|Field Goals Missed 30-39 Yards|-1|\r\n|Field Goals Missed 40-49 Yards|0|\r\n|Field Goals Missed 50+ Yards|0|\r\n|Point After Attempt Made|1|\r\n|Point After Attempt Missed|-3|\r\n\r\n|_. Defense/Special Teams|_. League value|\r\n|Sack|2|\r\n|Interception|4|\r\n|Fumble Recovery|4|\r\n|Touchdown|6|\r\n|Safety|6|\r\n|Block Kick|6|\r\n|Kickoff and Punt Return Touchdowns|6|\r\n|Points Allowed 0 points|15|\r\n|Points Allowed 1-6 points|8|\r\n|Points Allowed 7-13 points|6|\r\n|Points Allowed 14-20 points|3|\r\n|Points Allowed 21-27 points|1|\r\n|Points Allowed 28-34 points|0|\r\n|Points Allowed 35+ points|-4|\r\n|Defensive Yards Allowed 0-99|8|\r\n|Defensive Yards Allowed 100-199|6|\r\n|Defensive Yards Allowed 200-299|4|\r\n|Defensive Yards Allowed 300-399|2|\r\n|Defensive Yards Allowed 400-499|-4|\r\n|Defensive Yards Allowed 500+|-6|	2	\N	t	FAQ	2013-09-18 04:58:38.81494	2013-10-28 19:37:08.925401	t	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
23	Important league dates	League fees due: \r\nDraft:\r\nContract buy-outs: \r\nContracts, extensions, franchising: \r\nTrade deadline: *Tuesday at 8 a.m. of NFL Week 14*	1	\N	t	FAQ	2013-10-28 19:36:45.53261	2013-11-21 22:51:01.896856	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
20	More updates to the site	Check the "changelog":/changelog.txt for the full list of updates, but a number of cosmetic things have been done (added in avatars for users, for instance...just need to get them from the Yahoo site and add them here) along with changing the navigation to prepare for some future site updates.\n\nA section for all the league Facebook polls has been created and those will be added over the coming days.\n\nStay tuned! Rosters with salary information should be available soon!	3	\N	t	Announcements	2013-10-06 23:59:00.750987	2013-10-07 00:17:28.954917	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
22	Can I ever pick up a bought-out player again?	Yes. You may not have him on your roster for the remainder of the bought-out contract but after that contract has expired, you are free to pick that player up again.\r\n\r\nI.e.: Mike "TD Vulture" Tolbert who was shit for years and suddenly in 2013 is playing like he knows what he's doing.	6	\N	t	FAQ	2013-10-13 19:44:52.167867	2013-10-28 19:36:57.264144	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
18	How do contract extensions work?	By August 1 of the year of the next draft, there must be at least on year left on a player's contract in order for said player to be eligible for a contract extension.\r\n\r\nFor example: Kyle Kerley has Darren Sproles signed through 2014. In order to extend Sproles' contract, Kyle must decide by August 1, 2014 to extend or not.	4	\N	t	FAQ	2013-10-01 04:49:57.588333	2013-10-28 19:37:02.344588	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
24	Version 1.3 launched	Latest update to the site is now live and it's a big one. It's a stop-gap until the contracts logic is worked out, but for now, there have been a number of cosmetic/aesthetic changes throughout the site. \r\n\r\nNFL players have been added and Postgresql's out-of-the-box full-text search has been implemented to allow for quick and easy searching through players to find salary amounts (for the moment, not all of the players are in the database and no team information is associated with them).\r\n\r\nThere's still a lot of work to be done, but things are progressing nicely.	4	\N	t	Announcements	2013-11-30 18:31:21.921912	2013-11-30 18:31:21.921912	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
21	Buyout system: should we have one?	The first of what became a series of polls about the buyout clause. It was voted that yes, we should have a buyout clause added to the league. The result of this poll demanded additional polls be created in order to set the rules for how the buyout should work.	1	\N	t	Poll	2013-10-10 15:07:52.096748	2014-07-30 03:29:35.105281	t	\N	dopr_poll_buyout_should_we.png	image/png	63060	2014-07-30 03:29:33.206695	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
26	Buyout system: should the buyout apply to existing contracts or new contracts only?	It was decided that contracts should apply to contracts made prior to the 2013 season (when the buyout clause was ratified). Any existing contract would be eligible for a buyout.	3	\N	t	Poll	2013-12-01 21:52:15.553349	2014-07-30 03:30:16.072202	t	\N	dopr_poll_buyout_allow_existing_contracts.png	image/png	78538	2014-07-30 03:30:13.937176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
28	Buyout system: when should buyouts be allowed?	It was decided that buyouts should only be allowed in the offseason, the decision to be made by August 1.	4	\N	t	Poll	2013-12-01 21:54:27.639068	2014-07-30 03:30:32.321413	t	\N	dopr_poll_buyouts_when_allowed.png	image/png	75044	2014-07-30 03:30:30.390553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
36	How do post-season waiver pickups work?	Regarding Eli picking up Aaron Rodgers (value $28) on 12/24/13:\r\n\r\n*Tanker:* My view of the "offseason" has always been that the day the fantasy super bowl ends, the wire is for your next season's roster's pleasure, but on this season's dime. When I clear the rosters on August 1, your 2013 salaries will go away and your 2014 salaries begin. This is how it's been run in the past and how I will continue to run it in the future. Therefore on the matter of Aaron Rodgers vs. The People, I rule in favor of Aaron counting on 2013 (and since Eli I assume cannot afford him) and being immediately dropped back to the wire and counting still on Kerley's 2013. IF anyone has him on their roster as of August 1, it's 2014 salary.	7	\N	t	FAQ	2014-01-07 20:30:36.689073	2014-01-07 20:30:47.921771	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
31	Buyout system: should the buyout apply to dead money?	It was decided that yes, any active contract should be eligible for buyout regardless of roster status.	7	\N	t	Poll	2013-12-01 22:10:21.787028	2014-07-30 03:32:05.413297	t	\N	dopr_poll_buyout_apply_to_dead_money.png	image/png	69891	2014-07-30 03:32:03.575276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
25	Buyout system: final ratification of previously-voted on rules	It was decided that buyouts should be limited to one per season (decision made by August 1), it would only be eligible for existing contracts and the owner would pay 60% of the original contracted amount for the remainder of the contract.	6	\N	t	Poll	2013-12-01 21:50:58.493272	2014-07-30 03:32:52.20243	t	\N	dopr_poll_buyout_60_percent.png	image/png	97760	2014-07-30 03:32:50.151985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
32	Precedent: should GMs be given an extension on signing contracts for any reason?	It was decided that no, there is no extenuating circumstance that should allow for a GM to have an extension for submitting his (or her) contract extensions.	8	\N	t	Poll	2013-12-01 23:51:14.919209	2014-07-30 03:33:27.634409	t	\N	dopr_poll_first_year_wrong_email_extension.png	image/png	62614	2014-07-30 03:33:25.681849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
33	Maximum number of yearly contract extensions	The official league maximum number of yearly contract extensions was determined to be one (1) per team.	10	\N	t	Poll	2013-12-02 04:25:24.860784	2013-12-02 04:25:51.826436	t	\N	dopr_poll_number_of_extensions.png	image/png	44464	2013-12-02 04:25:23.555869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
34	What should be done with the one-year extension clause?	A split vote that ultimately decided that the extension should remain one year out from the end of a contract (i.e. if a player is in his last year of a contract, he cannot be extended. There must be one season remaining on the contract at the end of the current season for a player to be eligible for extension.	9	\N	t	Poll	2013-12-02 04:27:48.188975	2014-07-30 03:33:47.436027	t	\N	dopr_poll_one_year_extension_fate.png	image/png	53557	2014-07-30 03:33:45.605031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
39	Trophy: Should we get a trophy?	It was decided that yes, we should have a physical trophy for the league, even if it means an extra $5 from everyone.\r\n\r\nKyle Kerley was designated the trophy manager (holdover from the 2012 season's 3-10 record punishment).	11	\N	t	Poll	2014-01-31 17:20:43.206757	2014-01-31 17:51:02.427098	t	\N	dopr_poll_should_we_get_a_trophy.png	image/png	82467	2014-01-31 17:20:42.016093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
37	2.0 has arrived!	Contracts, updated salary progressions (out to 7 years), all-time standings and SO much more have been rolled out. \r\n\r\nEveryone's roster has been updated with their long-term contracts that include 2014 and beyond.\r\n\r\nUpcoming updates will include:\r\n* Fixing mobile issues (rosters on each team's page, for instance)\r\n* Adding yearly budgets for each team\r\n* A trade platform to catalog all trades and make cap adjustments as needed\r\n\r\nAnd so much more.	5	\N	t	Announcements	2014-01-10 19:15:04.825341	2014-01-11 07:36:50.488867	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
38	2.1.1 update rolled out	Another update has been rolled out. In addition to updating to Rails 3.2.16, this update has enhanced information on teams#show pages, breaking down rosters by number of each player of a given position. There are also better visual cues for franchised/extended players. Salary progressions now extend to 20 years (only 15 are shown). Seasons now run from 8/1-7/31 and rosters reflect this. Contracts still active for the 2013 have not yet been added to teams. \n\nApart from those, there are lots of little updates throughout with plenty more to come. See the "changelog":/changelog.txt for more information on what was changed.	6	\N	t	Announcements	2014-01-16 01:22:00.215975	2014-01-16 19:22:28.182543	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
41	Trophy: How should payment for shipping the trophy be handled?	It was decided that the $10 Trash Talker award would not be used for shipping the trophy but rather the loser has to pay shipping of the trophy to the winner.	12	\N	t	Poll	2014-01-31 17:50:36.116262	2014-01-31 17:51:05.065558	t	\N	dopr_poll_trophy_shipping.png	image/png	88919	2014-01-31 17:50:34.847215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
40	What should the penalty for not voting in league polls be?	It was decided that the penalty would be -$1 of cap space for the current year after being warned via Facebook and another non-Facebook channel to vote or be penalized.	14	\N	t	Poll	2014-01-31 17:22:25.584094	2014-07-30 03:35:31.261133	t	\N	dopr_poll_dock_gms_for_not_voting.png	image/png	76965	2014-07-30 03:35:29.279462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
42	2.2 released	Yet another massive update has been rolled out to the site. This one has  a ton of updates including:\n\n* User account roles so you guys can all login and will have access to do some things in future updates. Passwords to be distributed soon.\n* Free agents view under NFL players (and search for just FA)\n* Numerous updates to the database and view logic to better show contract status\n* Tons of UI updates throughout--including the global search box\n* Lots more! Check the "changelog":/changelog.txt for a full update.	7	\N	t	Announcements	2014-02-07 15:32:52.947557	2014-02-09 03:20:23.196385	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
30	Buyout system: how many contracts can be bought out per season?	It was decided that one (1) contract per season could be bought out per team.	2	\N	t	Poll	2013-12-01 22:04:40.44529	2014-07-30 03:29:54.185725	t	\N	dopr_poll_buyout_num_of_contracts.png	image/png	82178	2014-07-30 03:29:52.096208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
29	Buyout system: What percentage of the remaining contract should an owner be responsible for?	It was decided that the amount an owner should be responsible for paying on the remaining contract of a bought out player would be 60% of the contracted amount.	5	\N	t	Poll	2013-12-01 21:55:38.838403	2014-07-30 03:30:53.398691	t	\N	dopr_poll_buyouts_percentage_to_pay.png	image/png	73491	2014-07-30 03:30:51.447866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
35	Trash-talker award redistribution	The trash-talker award was deemed stupid and a number of options were presented as possible replacements. As the trash-talker award was $10, it could be any two $5 options or one $10 option when it came to voting. The following awards were decided on to replace the trash-talker award:\r\n\r\n* $5 for the smallest margin of defeat (to ease the pain of losing)\r\n* $5 for losing to the lowest winning score of the season	13	\N	t	Poll	2013-12-02 04:34:19.127529	2014-07-30 03:35:07.223977	t	\N	dopr_poll_trash_talker_award.png	image/png	98990	2014-07-30 03:35:05.047066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
46	Update 2.5 in production	Version 2.5 brings the messaging platform to the site along with a number of aesthetic updates, more of a dashboard feel to your team page and consolidated global navigation.\n\nThe "changelog":/changelog.txt has all of the details as usual.\n\nThe site is in the final stretches now! Next up is the trade platform. It's going to be big and messy but once that's done, the site will be ready for user testing with all league members.\n\n*Update:* Over the last few weeks, there have been 31 (to date) minor releases since 2.5 initially rolled out. These updates have ranged from changing minor things like icons to adding whole new features. Check out the updated "changelog":/changelog for all the details as always.	10	\N	t	Announcements	2014-05-12 04:21:04.275555	2014-06-02 05:14:11.337736	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
44	Version 2.3 rolled out	So many changes and updates have been put into the 2.3 release. New features include:\r\n\r\n* Events (global and personal)\r\n* Super Bowls and related picks. Logic has been implemented to automatically determine the winner even in the event of a tiebreaker\r\n* Draft rosters: create as many as you want and add whatever players you want to each of them. Drag-and-drop reordering has been implemented\r\n* Budgets for the next 50 years have been added and will be necessary for the 2.4 release which will include the trade platform\r\n* Favicon added\r\n* Lots more. Check out the "changelog":/changelog.txt for all the details!	8	\N	t	Announcements	2014-04-05 20:54:55.919517	2014-04-06 08:34:16.754612	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
43	Clarification on extensions and franchising	Say I have Aaron Rodgers to a long-term deal. I can extend him one year as long as I opt to use that BEFORE the start of his final contracted year. So that would mean that if I wanted to extend him, I'd have to make that call before the start of the 2015 season because I have him through the 2016 season, right? Or do I have to do it before the start of 2016? The way it's worded in the constitution is still a bit confusing to me.\r\n\r\nI also have the option to forego extending him and franchise him, correct? The franchise year would cost either the average of the top 5 QBs' auction values OR the next step of his salary progression, whichever is higher. And I can do that IN the 2016 season because the franchise tag works for free agent players picked up mid-season to give them another year on your roster.\r\n\r\nAfter a player has been franchised, he CANNOT be extended, correct? \r\n\r\nHowever, if a player has been extended, he may also be franchised, correct?\r\n\r\nFinally, is there a limit to how early a player may be extended, franchised or both? Can I choose to extend and franchise Rodgers now? Or can those options only be used in the second-to-last year of the contract (for extending) or the last year of the contract (for franchising)?\r\n\r\n==========\r\n*Answers*\r\nSo if he's signed through 2016, you can't extend him the same year his contract is ending, so to extend, you'd do so in 2015 to extend to 2017. To franchise, you could do in 2017 after his contract ends. IE, me and Welker. You are correct that you can extend then franchise but not the other way. It's confusing to say but makes sense when you look at it.\r\n\r\nPlayers may be extended and/or franchised at any time. There is no rule on when a player is first eligible apart from the fact he's on a team's roster.	8	\N	t	FAQ	2014-02-09 02:45:24.244992	2014-04-16 00:42:17.378495	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
45	Another day, another site update (version 2.4 now)	A stepping-stone update, the biggest addition is the Site Activity feed (found on the "homepage":/) that shows when informational posts (like this one, Constitution updates/additions, FAQs, Polls, etc) are created, updated and destroyed. Same deal with contracts. \r\n\r\nVisibility into these things is important and this will provide some more of that. Once trades have been implemented, this will become a much bigger deal.\r\n\r\nOther changes include mostly cosmetic stuff. As always, the "changelog":/changelog.txt has all the juicy tidbits.	9	\N	t	Announcements	2014-04-25 01:34:57.940792	2014-04-25 01:36:15.631606	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
48	Team page overview	Your team page is your dashboard for this site. It contains all information relevant to your players, cap space, trades and a few other items that are new with this site.\r\n\r\nWhen your team page loads, the first thing you'll see if your roster which includes the current year + the next 4 years. Each column contains the salary total and remainder along with that year's total amount of available cap (default $130). If a trade has gone through that impacts a yearly cap amount, its background will be pinkish and clicking on the amount will open that budget's page showing any/all trade stipulations affecting it.	1	\N	t	Help	2014-06-25 16:56:45.154365	2014-06-25 16:56:45.154365	t	\N	help_roster.png	image/png	98364	2014-06-25 16:56:42.502674	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
49	Roster by position	Below the main roster is a breakdown of the current year's roster by player position.	2	\N	f	Help	2014-06-25 16:59:00.195273	2014-06-25 16:59:00.195273	t	\N	help_roster_position.png	image/png	35898	2014-06-25 16:58:58.61057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
50	Roster by bye week	Finally, the last item on the main tab of the team page shows a breakdown of your current year's roster by bye week to better help you plan for those most cursed of Sundays.	3	\N	f	Help	2014-06-25 17:00:00.041233	2014-06-25 17:00:00.041233	t	\N	help_roster_bye.png	image/png	47194	2014-06-25 16:59:58.172033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
51	GM actions sidebar	This panel provides information on players currently on your roster and/or signed to long-term deals regarding how much extending and franchising will cost. A later update will allow you to extend and franchise once per season without needing to get Tanker involved to do it for you.\r\n\r\nIn addition, it gives a link to create a new trade and a list of pending trades (meaning trades that are awaiting your acceptance).\r\n\r\nBelow this is the place to submit your yearly Super Bowl pick for the $5 prize. Once a new Super Bowl has been added to the site, the panel will allow you to submit a pick right there in place and, after doing so, will show your pick for the remainder of the season.	4	\N	t	Help	2014-06-25 17:05:32.247635	2014-06-25 17:05:32.247635	t	\N	help_gm_actions.png	image/png	79775	2014-06-25 17:05:30.291867	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
52	Draft rosters	Draft rosters are a way for you to create lists of players to keep track of for the draft or throughout the season. Simply add them to any draft roster you have by clicking on the eye icon on the "players":/players page.\r\n\r\nDraft Rosters may be drag-and-drop sorted and re-sorted to your heart's content.	5	\N	\N	Help	2014-06-26 14:29:22.617551	2014-06-26 14:29:22.617551	t	\N	help_draft_rosters.png	image/png	23843	2014-06-26 14:29:21.28348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
54	Global nav team dropdown	Each of you has your avatar (or a nice cupcake if you opted to not have an avatar on Yahoo) to the right of the global search box. Clicking this shows a dropdown with a link to your profile page (showing the roster information by default).\r\n\r\nIt also contains the following information/links:\r\n* A number in red or 0 in gray: this is your count of unread messages and pending trades combined\r\n* Trades: the number of pending trades (same number shown in the tabbed navigation ON your team page)\r\n* Messages: the number of unread messages in your inbox (same number shown in the tabbed navigation ON your team page)\r\n* Draft Rosters\r\n* Payouts\r\n\r\nAll of those items will take you to that specific tab on the team page unless you're already on one of those tabs on the team page. Then due to a bug with Twitter Bootstrap and jQuery, it won't allow you to go to additional tabs via the dropdown, but clicking the tabs on your team page works as expected.	7	\N	\N	Help	2014-06-26 14:45:43.676596	2014-06-26 14:45:43.676596	t	\N	help_top_nav_dropdown.png	image/png	18182	2014-06-26 14:45:42.685426	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
53	Players list	The full list of "players":/players contains all the relevant info that could be fit into this view while leaving the table usable. It has their current season's auction value and their current salary amount if they've been signed to a contract. There's also a link to view the contract details (blue document icon) if applicable.\r\n\r\nThe "eye" icon is for adding a player to one of your draft rosters. Click it to show a popup dialog containing the list of your existing draft rosters or a button to create a new one.\r\n\r\nPlayers may be sorted by name, team or auction value. The buttons above the list allow you to filter by all, free agents only (FA) or position.\r\n\r\nYou may search for players by entering a first or last name, position, NFL team (using the 2- or 3-letter shorthand, i.e.: DAL, GB, HOU, SF, etc.), or auction value (without a $...so just search for 7 if you want to see all players with a $7 auction value).	6	\N	\N	Help	2014-06-26 14:32:03.985441	2014-06-26 14:48:47.992471	t	\N	help_players_list.png	image/png	49685	2014-06-26 14:32:02.18784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
47	Version 2.6: the last major update (for now)	After over a month, version 2.6 is now in production. This update bring a number of changes throughout the site but the most important/largest of them is the addition of the "trades":/trades platform. \r\n\r\nCreating a new trade with another GM allows you to swap players, cap space, draft pick or other items (like Cody getting my vote in an upcoming poll and Kyle B getting the rights to my avatar for the 2014 season).\r\n\r\nA "help":/help section has also been added and content will be coming shortly for that with general tips for site usage and things that GMs are able to do.\r\n\r\nAdditional functionality and aesthetic updates will continue to be made and called out as they warrant it. The site will be open soon to all GMs for use!	11	\N	t	Announcements	2014-06-24 02:48:00.163222	2014-06-27 18:04:59.373086	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
55	Trades: overview and initiating	Trades allow you to modify existing contracts by changing GMs, add/remove cap space, give away draft picks or even do something outside of the world of football (like buy someone's vote in an upcoming poll of your choosing or have avatar rights for an entire season).\r\n\r\nTrades work by first selecting the other team from the top dropdown. *Make sure to do this first as it can cause issues with the stipulations if not set before creating stipulations.* \r\n\r\nChoose the type of stipulation for the trade (Cap space, Player, Draft Spot or Other) and then select from the "Direction" dropdown if whatever this stipulation is is going TO or being received FROM  the other team.\r\n\r\nFor players, the Direction box dynamically and immediately changes the contents of the Player dropdown box to either be the trade initiator's players ("to") or the trade recipient's players ("from"). If the trade is for a single season, simply enter the year and leave the "Rest of contract" box unchecked. If "Rest of contract" is selected, the remaining years of the contract will all be updated to reflect the changes.\r\n\r\nFor all non-player trades, the "Terms" box is for you to enter how much cap space should be moved around for that given season (*do NOT put a $ in that box*), which draft round a pick is for or what other weird terms you may have.	8	\N	\N	Help	2014-06-26 19:31:38.547335	2014-06-29 19:50:18.056843	t	\N	help_trade_01.png	image/png	41887	2014-06-26 19:31:36.192906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
56	Trades: editing and accepting	Only the trade initiator may edit the terms of the trade. This is to keep things simpler to manage and to keep stipulation abuse to a minimum.\r\n\r\nThe recipient must edit the trade and check the box that says they accept the terms of the trade. Doing so and updating the trade then will put the stipulations into effect.\r\n\r\nThe trade cannot and will not go through unless both parties accept the terms via the checkboxes. Trades cannot be created until the initiator accepts the terms.\r\n\r\nSo in the example below, Jim gets Rodgers for the rest of his contract + $8 in 2014 and $6 in 2015 of cap space from Kyle K. Kyle gets Peyton for the rest of his contract (which is up at the end of 2014 anyway) with the option to franchise. A notification message was sent to Jim letting him know of the trade proposal. If Jim is okay with this trade, he can edit the trade and check the box saying he accepts it. After hitting the "update trade" button, the stipulations will be put into effect. Cap space will be removed from Kyle's budgets for 2014 and 2015 and the owners of Manning and Rodgers will be swapped.	10	\N	\N	Help	2014-06-29 19:43:55.413072	2014-08-02 19:30:56.551681	t	\N	help_trades_receiver_edit.png	image/png	167620	2014-08-02 19:30:52.843715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
61	Super Bowls	These are a bit more complicated and involved and aren't totally ready for production yet. Thankfully, there's still plenty of time to get all the kinks worked out. Originally, this was a very manual process, but most of it has been automated. Things just get a little tricky with tiebreakers and that needs to be finished.\r\n\r\nThe only things that need to be done from an admin standpoint are actually creating the new Super Bowl and then going back later and adding both NFL teams to it. GM's submit their own picks from the GM actions panel on their team page and the site will take care of the rest after the final scores have been added.\r\n\r\n*This article will be updated later once work has been completed on the Super Bowl picks.*	4	\N	\N	Admin help	2014-06-29 20:36:27.828803	2014-06-29 20:36:27.828803	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
63	Welcome to the 2014 season	Minor cosmetic updates have been made throughout the site, but it's always changing and I always want to hear how you guys would like to see it, so keep suggestions coming.\r\n\r\nThe "players":/players master list has been updated with all new players, NFL team shuffling and most-current auction values. A few players are still up in the air so once their teams are known, they'll be updated.\r\n\r\n*Please add your trades.* It would be a good exercise to see how the trade forms work and will get your rosters updated.\r\n\r\n*Add your Super Bowl pick.* You can do so from the GM actions panel on your team's page.\r\n\r\nThere are some "help":/help articles available. Please take a look at them and let me know if there are still questions about how to do things on the site or if you'd like to see more/better detail on what's already there.	12	\N	\N	Announcements	2014-08-02 16:13:52.941422	2014-08-02 16:14:00.761626	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
59	Adding payouts	Creating the league payouts for each year is extremely simple to do. On the "admin":/admin page, simply select the "Add payouts" button from the actions bar. \r\n\r\nThe form that loads will auto-fill with the current year (custom logic has been put into place so that the season runs from 8/1-7/31 of each year) in the "Year" box and the award names and values all pull in automatically. These can be edited as needed.\r\n\r\nSimply select the award winner from the dropdown. Not all awards must be added at once, so if you want to get the records created without having winners for each, that's totally possible.	2	\N	\N	Admin help	2014-06-29 20:25:34.751933	2014-08-09 20:31:14.667947	t	\N	admin_help_adding_payouts.png	image/png	90287	2014-08-09 20:31:11.284671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
60	Adding content via .csv upload	Players may be hand-edited one-by-one by clicking their name to view their contract information from the "players":/players page, however, the only way to mass-update all of them is to upload a .csv file.\r\n\r\n*The same goes for salary progressions and NFL teams.*\r\n\r\nThis is far faster and more efficient than doing it via webforms. However, this does allow for errors to happen much easier if proper protocol isn't followed every single time.\r\n\r\nIn order to not create duplicate players, *it is imperative to download the full list of players, NFL teams and/or salary progressions FIRST* from the site. The reason for this is that when uploading .csv files for any of these three data models, the application looks for an ID field. If there is one, it finds the player in question based on that ID and updates their information. If there is no ID column, it assumes everyone in the file is new and will add every single player as a new entry. *This will cause major issues.*\r\n\r\nEach tab has an upload field and next to it, a download button to pull down a .csv of what's currently in the database. DO THIS FIRST. Then open in Excel and make all the necessary updates to teams, auction value, etc.\r\n\r\nIt's also crucial to use the 2- or 3-letter team shorthand for each player to match them to their respective NFL team and pull in the necessary bye week information.	3	\N	\N	Admin help	2014-06-29 20:33:50.812727	2014-08-09 20:31:33.524072	t	\N	admin_help_uploading_csv.png	image/png	30140	2014-08-09 20:31:31.501191	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
57	Trades: adding stipulations	There are 4 types of stipulations:\r\n* Cap space\r\n* Draft spots\r\n* Players\r\n* Other\r\n\r\nSelect the appropriate type from the "Type" dropdown. For players, once the "Direction" is set, a dropdown containing either the initiator's or recipient's players will show on the screen along with a checkbox for the "rest of contract." Otherwise, the "Terms" box will remain. \r\n\r\nFor *cap space* stipulations, the "Terms" box needs to contain how much cap space is being trades WITHOUT DOLLAR SIGNS.\r\n\r\nFor *draft picks* stipulations, the "Terms" box needs to contain the round the pick in question is for.\r\n\r\nFor *other* stipulations, the "Terms" box should contain whatever the terms of this stipulation are (for instance: a vote in an upcoming poll of the recipient's choosing, avatar rights for the season, etc.).\r\n\r\nFor *players* stipulations, the "Year" will be either the one year the player is being traded for or the starting point for moving the rest of the contract over to the recipient (so if Aaron Rodgers is traded for the rest of his contract starting with the 2014 season, 2014 needs to be put into the "Year" box and the "rest of contract" box needs to be checked).	9	\N	\N	Help	2014-06-29 19:49:50.695545	2014-08-02 19:28:47.084083	t	\N	help_trade_02.png	image/png	55628	2014-08-02 19:28:43.803742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
58	Creating new site content	All site content (announcements, Facebook polls, Constitution articles, FAQs, help content) is handled by the same form. On the "admin":/admin page, select the "Add info" button from the actions bar. \r\n\r\nChoose the type of content it's supposed to be from the dropdown, put in the order (this can be updated after the content is created if you don't know what it should be off the top of your head). \r\n\r\nIf the content should be published immediately, check the box. \r\n\r\nFont formatting is supported; the site uses the "RedCloth Textile plugin":http://redcloth.org/ for formatting. Anything shown on that site can be done here.\r\n\r\nOnly one image may be attached to each content article. Images currently are only going to be shown on help and Facebook poll articles, however.\r\n\r\nOn the admin page, it's possible to edit the content of posts right from the admin page by expanding the article (by clicking on its title) and then clicking on the text area containing the content. Edit right in the box and click outside of it for the edits to be saved. Do not click in/out of the same box numerous times without first refreshing the admin page as there is a bug in the plugin that uses the original cached content, overwriting any changes you just made.	1	\N	\N	Admin help	2014-06-29 20:07:40.606926	2014-08-09 20:30:51.227052	t	\N	admin_help_adding_content.png	image/png	47772	2014-08-09 20:30:48.81675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
62	Contracts: how to create a new one	_This assumes the player in question is a free agent._\r\n\r\nIn order to create a new contract between a player and team, find the player via the search box and click either on his name (and then click the link to "Add a contract for <player name>") or the "Edit" button in the search results.\r\n\r\nYou can adjust the player's name, team, auction value and position on this screen. Below that info are the fields for creating a new contract. *DO NOT ADD A CONTRACT IF THERE IS ALREADY AN ACTIVE ONE.* (Buyouts don't apply since those contracts are not considered active.)\r\n\r\nThe process has been simplified: choose the team the player was drafted by, the start year has been auto-filled and MAKE SURE TO CHECK THE "DRAFTED" BOX.\r\n\r\nHit update and the new 1-year contract will be created. Later on, if the GM decides to extend this contract, editing the actual contract (not the player like we are here) by inputting the full-length of the contract is all that's necessary to get the rest of the subcontracts created.	5	\N	\N	Admin help	2014-07-01 00:21:56.07934	2014-08-28 01:22:12.808628	t	\N	Screenshot_2014-08-27_19.17.03.png	image/png	56294	2014-08-28 01:22:09.547515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
\.


--
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('features_id_seq', 63, true);


--
-- Data for Name: nfl_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY nfl_teams (id, mascot, conference, city, shorthand, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, bye_week) FROM stdin;
18	Giants	NFC	New York	NYG	2014-05-21 14:57:12.16748	2014-07-30 03:27:34.236942	new-york-giants-logo.jpg	image/jpeg	56667	2014-07-30 03:27:33.453685	8
19	Eagles	NFC	Philadelphia	PHI	2014-05-21 14:57:12.173186	2014-07-30 03:27:45.747633	Philadelphia_Eagles_logo.png	image/png	69348	2014-07-30 03:27:45.148505	7
31	49ers	NFC	San Francisco	SF	2014-05-21 14:57:12.24506	2014-07-30 03:27:57.403629	san-francisco-49ers-logo.png	image/png	76833	2014-07-30 03:27:56.585092	8
5	Ravens	AFC	Baltimore	BAL	2014-05-21 14:57:12.098804	2014-07-30 03:21:27.775235	baltimore-ravens-logo.png	image/png	142984	2014-07-30 03:21:26.415029	11
1	Bills	AFC	Buffalo	BUF	2014-05-21 14:57:12.071895	2014-07-30 03:21:39.873032	buffalo-bills-logo.jpg	image/jpeg	76011	2014-07-30 03:21:39.027961	9
6	Bengals	AFC	Cincinnati	CIN	2014-05-21 14:57:12.103839	2014-07-30 03:21:54.730237	CincinnatiBengals-logo.jpg	image/jpeg	267108	2014-07-30 03:21:53.72994	4
7	Browns	AFC	Cleveland	CLE	2014-05-21 14:57:12.109065	2014-07-30 03:22:30.163483	cleveland-browns-logo.png	image/png	149551	2014-07-30 03:22:29.221143	4
13	Broncos	AFC	Denver	DEN	2014-05-21 14:57:12.14066	2014-07-30 03:22:41.298477	denver-broncos-logo.png	image/png	73814	2014-07-30 03:22:40.49922	4
9	Texans	AFC	Houston	HOU	2014-05-21 14:57:12.119497	2014-07-30 03:22:55.016536	houston-texans-logo.png	image/png	85055	2014-07-30 03:22:53.934634	10
10	Colts	AFC	Indianapolis	IND	2014-05-21 14:57:12.124818	2014-07-30 03:23:14.719556	indianapolis-colts-logo.png	image/png	93171	2014-07-30 03:23:13.680471	10
11	Jaguars	AFC	Jacksonville	JAC	2014-05-21 14:57:12.129942	2014-07-30 03:23:28.07257	jacksonville-jaguars-logo.png	image/png	460185	2014-07-30 03:23:27.022023	11
14	Chiefs	AFC	Kansas City	KC	2014-05-21 14:57:12.145964	2014-07-30 03:23:40.142854	kansas-city-chiefs-logo.png	image/png	78149	2014-07-30 03:23:39.3082	6
2	Dolphins	AFC	Miami	MIA	2014-05-21 14:57:12.082215	2014-07-30 03:24:12.585296	miami-dolphins-logo.png	image/png	165283	2014-07-30 03:24:11.607609	5
3	Patriots	AFC	New England	NE	2014-05-21 14:57:12.087773	2014-07-30 03:24:26.725561	new-england-patriots-logo.png	image/png	58687	2014-07-30 03:24:25.982159	10
4	Jets	AFC	New York	NYJ	2014-05-21 14:57:12.093402	2014-07-30 03:24:39.206414	new-york-jets-logo.png	image/png	63252	2014-07-30 03:24:38.367495	11
15	Raiders	AFC	Oakland	OAK	2014-05-21 14:57:12.150978	2014-07-30 03:24:52.508122	Oakland_Raiders-logo.png	image/png	102417	2014-07-30 03:24:51.628822	5
32	Seahawks	NFC	Seattle	SEA	2014-05-21 14:57:12.250209	2014-07-30 03:28:09.229859	Seattle_Seahawks_logo.png	image/png	37566	2014-07-30 03:28:08.476542	4
30	Rams	NFC	St. Louis	STL	2014-05-21 14:57:12.239119	2014-07-30 03:28:22.178046	st-louis-rams-logo.png	image/png	88803	2014-07-30 03:28:21.305594	4
28	Buccaneers	NFC	Tampa Bay	TB	2014-05-21 14:57:12.227721	2014-07-30 03:28:34.051171	tampa_bay_buccaneers.png	image/png	231465	2014-07-30 03:28:33.291446	7
20	Redskins	NFC	Washington	WAS	2014-05-21 14:57:12.178616	2014-07-30 03:28:44.720066	washington-redskins-logo.png	image/png	143297	2014-07-30 03:28:43.644006	10
8	Steelers	AFC	Pittsburgh	PIT	2014-05-21 14:57:12.11426	2014-07-30 03:25:03.967002	pittsburgh_steelers_logo.png	image/png	45916	2014-07-30 03:25:03.315547	12
16	Chargers	AFC	San Diego	SD	2014-05-21 14:57:12.156085	2014-07-30 03:25:17.274051	san-diego-chargers-logo.png	image/png	98757	2014-07-30 03:25:16.217064	10
12	Titans	AFC	Tennessee	TEN	2014-05-21 14:57:12.135375	2014-07-30 03:25:30.226039	tennessee-titans-logo.png	image/png	84781	2014-07-30 03:25:29.585889	9
29	Cardinals	NFC	Arizona	ARI	2014-05-21 14:57:12.233469	2014-07-30 03:25:42.552423	arizona-cardinals-logo.png	image/png	86995	2014-07-30 03:25:41.586806	4
25	Falcons	NFC	Atlanta	ATL	2014-05-21 14:57:12.20933	2014-07-30 03:25:54.507611	atlanta-falcons-logo.png	image/png	90047	2014-07-30 03:25:53.478947	9
26	Panthers	NFC	Carolina	CAR	2014-05-21 14:57:12.215388	2014-07-30 03:26:06.832359	carolina-panthers-logo.png	image/png	61306	2014-07-30 03:26:06.036933	12
21	Bears	NFC	Chicago	CHI	2014-05-21 14:57:12.183696	2014-07-30 03:26:20.979577	chicago-bears-logo.png	image/png	75524	2014-07-30 03:26:20.151982	9
17	Cowboys	NFC	Dallas	DAL	2014-05-21 14:57:12.161597	2014-07-30 03:26:32.648148	dallas-cowboys-logo.png	image/png	66174	2014-07-30 03:26:31.646833	11
22	Lions	NFC	Detroit	DET	2014-05-21 14:57:12.190484	2014-07-30 03:26:44.774742	detroit-lions-logo.png	image/png	93007	2014-07-30 03:26:43.866177	9
23	Packers	NFC	Green Bay	GB	2014-05-21 14:57:12.196409	2014-07-30 03:26:56.528697	Green-Bay-Packers-Logo.png	image/png	9718	2014-07-30 03:26:55.976759	9
24	Vikings	NFC	Minnesota	MIN	2014-05-21 14:57:12.20206	2014-07-30 03:27:08.381554	minnesota-vikings-logo.png	image/png	45185	2014-07-30 03:27:07.671587	10
27	Saints	NFC	New Orleans	NO	2014-05-21 14:57:12.222108	2014-07-30 03:27:20.346005	New_Orleans_Saints_logo.png	image/png	25004	2014-07-30 03:27:19.708995	6
\.


--
-- Name: nfl_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nfl_teams_id_seq', 32, true);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notifications (id, type, body, subject, sender_id, sender_type, conversation_id, draft, updated_at, created_at, notified_object_id, notified_object_type, notification_code, attachment, global, expires) FROM stdin;
1	Message	Do you have any feedback for me yet? Anything you've noticed that needs to be changed, that you'd like to be added/removed?	How's the testing coming along?	1	User	1	f	2014-05-12 04:25:00.18353	2014-05-12 04:25:00.18353	\N	\N	\N	\N	f	\N
9	Message	Any feedback for me? Anything you hate? Anything you want to see added or removed?	How's your testing coming along?	1	User	8	f	2014-05-12 04:56:08.319157	2014-05-12 04:56:08.319157	\N	\N	\N	\N	f	\N
10	Message	Penis penis penis penis penis	8======D	1	User	9	f	2014-05-13 21:38:34.918445	2014-05-13 21:38:34.918445	\N	\N	\N	\N	f	\N
11	Message	Hey, I sent you a trade proposal	Trade proposal awaiting your approval	1	User	10	f	2014-06-25 17:55:06.968149	2014-06-25 17:55:06.968149	\N	\N	\N	\N	f	\N
12	Message	Penis confirmed	RE: 8======D	7	User	9	f	2014-07-21 17:06:49.713533	2014-07-21 17:06:49.713533	\N	\N	\N	\N	f	\N
13	Message	Yes! It works!	RE: 8======D	1	User	9	f	2014-07-21 17:18:38.023107	2014-07-21 17:18:38.023107	\N	\N	\N	\N	f	\N
14	Message	Hey, I sent you a trade proposal	Trade proposal awaiting your approval	2	User	11	f	2014-08-02 16:47:47.869308	2014-08-02 16:47:47.869308	\N	\N	\N	\N	f	\N
15	Message	this site is fucking SICK. you've gotta market this out.	RE: How's your testing coming along?	2	User	8	f	2014-08-02 16:51:38.247657	2014-08-02 16:51:38.247657	\N	\N	\N	\N	f	\N
16	Message	Hey, I sent you a trade proposal	Trade proposal awaiting your approval	14	User	12	f	2014-08-02 18:35:11.581816	2014-08-02 18:35:11.581816	\N	\N	\N	\N	f	\N
17	Message	Thanks, dude. Once all the bugs are ironed out...	RE: How's your testing coming along?	1	User	8	f	2014-08-02 18:43:25.385929	2014-08-02 18:43:25.385929	\N	\N	\N	\N	f	\N
18	Message	Hey, I sent you a trade proposal	Trade proposal awaiting your approval	5	User	13	f	2014-08-12 21:08:08.198048	2014-08-12 21:08:08.198048	\N	\N	\N	\N	f	\N
19	Message	Hey, I sent you a trade proposal	Trade proposal awaiting your approval	7	User	14	f	2014-08-13 14:43:01.214633	2014-08-13 14:43:01.214633	\N	\N	\N	\N	f	\N
20	Message	Hey, I sent you a trade proposal	Trade proposal awaiting your approval	3	User	15	f	2014-09-04 21:57:06.812567	2014-09-04 21:57:06.812567	\N	\N	\N	\N	f	\N
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notifications_id_seq', 20, true);


--
-- Data for Name: payouts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY payouts (id, year, created_at, updated_at) FROM stdin;
1	2012	2013-09-18 15:05:44.758345	2013-09-18 15:05:44.758345
2	2011	2013-09-25 02:09:36.813513	2013-09-25 02:09:36.813513
3	2013	2013-12-12 15:50:36.542325	2013-12-12 15:50:36.542325
4	2014	2014-09-09 14:13:45.907623	2014-09-09 14:13:45.907623
\.


--
-- Name: payouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payouts_id_seq', 4, true);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY players (id, first_name, last_name, nfl_team, "position", auction_value, bye_week, created_at, updated_at, is_retired) FROM stdin;
324	Mike	Wallace	MIA	WR	4	5	2014-01-10 19:11:55.96033	2014-08-04 14:38:30.961122	f
379	James	Starks	GB	RB	0	\N	2014-09-03 01:54:31.369416	2014-09-03 01:54:31.369416	f
3	Tony	Romo	DAL	QB	11	11	2014-01-10 19:11:54.441743	2014-01-10 19:11:54.441743	f
20	Christian	Ponder	MIN	QB	0	10	2014-01-10 19:11:54.516414	2014-01-10 19:11:54.516414	f
2	Robert	Griffin III	WAS	QB	0	10	2014-01-10 19:11:54.436848	2014-08-02 05:53:43.837693	f
4	Russell	Wilson	SEA	QB	3	4	2014-01-10 19:11:54.446207	2014-08-02 05:53:43.852332	f
5	Colin	Kaepernick	SF	QB	10	8	2014-01-10 19:11:54.451439	2014-08-02 05:53:43.866143	f
6	Jay	Cutler	CHI	QB	6	9	2014-01-10 19:11:54.455724	2014-08-02 05:53:43.878493	f
7	Sam	Bradford	STL	QB	1	4	2014-01-10 19:11:54.460001	2014-08-02 05:53:43.884443	f
8	Ben	Roethlisberger	PIT	QB	4	12	2014-01-10 19:11:54.464223	2014-08-02 05:53:43.893448	f
9	Josh	Freeman	TB	QB	0	7	2014-01-10 19:11:54.468589	2014-08-02 05:53:43.899453	f
10	Matt	Schaub	OAK	QB	0	5	2014-01-10 19:11:54.473005	2014-08-02 05:53:43.913593	f
11	Carson	Palmer	ARI	QB	2	4	2014-01-10 19:11:54.478199	2014-08-02 05:53:43.920209	f
12	Ryan	Tannehill	MIA	QB	1	5	2014-01-10 19:11:54.482554	2014-08-02 05:53:43.929453	f
13	Joe	Flacco	BAL	QB	0	11	2014-01-10 19:11:54.486754	2014-08-02 05:53:43.935285	f
14	Mike	Vick	PHI	QB	0	7	2014-01-10 19:11:54.491081	2014-08-02 05:53:43.945788	f
15	Jake	Locker	TEN	QB	0	9	2014-01-10 19:11:54.49529	2014-08-02 05:53:43.961168	f
16	Alex	Smith	KC	QB	1	6	2014-01-10 19:11:54.499531	2014-08-02 05:53:43.97458	f
17	EJ	Manuel	BUF	QB	0	9	2014-01-10 19:11:54.503825	2014-08-02 05:53:43.980353	f
18	Geno	Smith	NYJ	QB	0	11	2014-01-10 19:11:54.508051	2014-08-02 05:53:43.98959	f
21	Matt	Flynn	OAK	QB	0	5	2014-01-10 19:11:54.520737	2014-08-02 05:53:44.013432	f
22	Blaine	Gabbert	JAC	QB	0	11	2014-01-10 19:11:54.524851	2014-08-02 05:53:44.030391	f
23	Steven	Jackson	ATL	RB	4	9	2014-01-10 19:11:54.528953	2014-08-02 05:53:44.041573	f
24	Lamar	Miller	MIA	RB	2	5	2014-01-10 19:11:54.533169	2014-08-02 05:53:44.058427	f
25	Frank	Gore	SF	RB	7	8	2014-01-10 19:11:54.537304	2014-08-02 05:53:44.073575	f
26	Le'Veon	Bell	PIT	RB	23	12	2014-01-10 19:11:54.541462	2014-08-02 05:53:44.088375	f
27	Montee	Ball	DEN	RB	26	4	2014-01-10 19:11:54.545654	2014-08-02 05:53:44.094296	f
28	Chris	Ivory	NYJ	RB	1	11	2014-01-10 19:11:54.549886	2014-08-02 05:53:44.105744	f
29	Shane	Vereen	NE	RB	14	10	2014-01-10 19:11:54.554016	2014-08-02 05:53:44.117544	f
30	Ahmad	Bradshaw	IND	RB	0	10	2014-01-10 19:11:54.558194	2014-08-02 05:53:44.123682	f
31	Andre	Brown	NYG	RB	0	8	2014-01-10 19:11:54.562362	2014-08-02 05:53:44.133472	f
32	Giovani	Bernard	CIN	RB	25	4	2014-01-10 19:11:54.566545	2014-08-02 05:53:44.139322	f
33	Eddie	Lacy	GB	RB	24	9	2014-01-10 19:11:54.570783	2014-08-02 05:53:44.157874	f
34	Pierre	Thomas	NO	RB	5	6	2014-01-10 19:11:54.574996	2014-08-02 05:53:44.165115	f
35	BenJarvus	Green-Ellis	CIN	RB	0	4	2014-01-10 19:11:54.579127	2014-08-02 05:53:44.177555	f
36	Ronnie	Hillman	DEN	RB	0	4	2014-01-10 19:11:54.583205	2014-08-02 05:53:44.183222	f
37	Daryl	Richardson	STL	RB	0	4	2014-01-10 19:11:54.587329	2014-08-02 05:53:44.193418	f
39	Ben	Tate	CLE	RB	6	4	2014-01-10 19:11:54.595566	2014-08-02 05:53:44.210889	f
40	Jonathan	Stewart	CAR	RB	0	12	2014-01-10 19:11:54.599692	2014-08-02 05:53:44.221441	f
41	Bernard	Pierce	BAL	RB	2	11	2014-01-10 19:11:54.603839	2014-08-02 05:53:44.227201	f
44	Zac	Stacy	STL	RB	18	4	2014-01-10 19:11:54.61611	2014-08-02 05:53:44.257903	f
45	Shonn	Greene	TEN	RB	0	9	2014-01-10 19:11:54.620291	2014-08-02 05:53:44.265359	f
46	Isaiah	Pead	STL	RB	0	4	2014-01-10 19:11:54.624409	2014-08-02 05:53:44.277775	f
47	Danny	Woodhead	SD	RB	4	10	2014-01-10 19:11:54.628549	2014-08-02 05:53:44.289423	f
48	Vick	Ballard	IND	RB	0	10	2014-01-10 19:11:54.632667	2014-08-02 05:53:44.295709	f
49	Joseph	Randle	DAL	RB	0	11	2014-01-10 19:11:54.637028	2014-08-02 05:53:44.301386	f
50	Johnathan	Franklin	GB	RB	0	8	2014-01-10 19:11:54.641303	2014-08-02 05:53:44.313524	f
51	Kendall	Hunter	SF	RB	0	8	2014-01-10 19:11:54.645658	2014-08-02 05:53:44.319111	f
52	Jacquizz	Rodgers	ATL	RB	0	9	2014-01-10 19:11:54.649759	2014-08-02 05:53:44.329325	f
53	Ryan	Williams	ARI	RB	0	4	2014-01-10 19:11:54.653875	2014-08-02 05:53:44.341412	f
54	Michael	Bush	CHI	RB	0	9	2014-01-10 19:11:54.65797	2014-08-02 05:53:44.358828	f
55	Robert	Turbin	SEA	RB	0	4	2014-01-10 19:11:54.662047	2014-08-02 05:53:44.37342	f
56	Mike	Goodson	NYJ	RB	0	11	2014-01-10 19:11:54.666522	2014-08-02 05:53:44.379545	f
57	Jonathan	Dwyer	PIT	RB	0	12	2014-01-10 19:11:54.670702	2014-08-02 05:53:44.389448	f
58	Rashad	Jennings	NYG	RB	7	8	2014-01-10 19:11:54.674996	2014-08-02 05:53:44.394983	f
59	LaMichael	James	SF	RB	0	8	2014-01-10 19:11:54.679136	2014-08-02 05:53:44.405429	f
60	Mike	Gillislee	MIA	RB	0	5	2014-01-10 19:11:54.683198	2014-08-02 05:53:44.411105	f
61	Knile	Davis	KC	RB	0	6	2014-01-10 19:11:54.687372	2014-08-02 05:53:44.421417	f
62	Marcel	Reece	OAK	RB	0	5	2014-01-10 19:11:54.691595	2014-08-02 05:53:44.426795	f
63	Mike	Tolbert	CAR	RB	0	12	2014-01-10 19:11:54.69579	2014-08-02 05:53:44.437418	f
64	DuJuan	Harris	GB	RB	0	8	2014-01-10 19:11:54.699996	2014-08-02 05:53:44.442759	f
65	Bilal	Powell	NYJ	RB	0	11	2014-01-10 19:11:54.70416	2014-08-02 05:53:44.457897	f
66	Roy	Helu	WAS	RB	1	10	2014-01-10 19:11:54.708297	2014-08-02 05:53:44.464531	f
68	Toby	Gerhart	JAC	RB	13	11	2014-01-10 19:11:54.716637	2014-08-02 05:53:44.479867	f
69	Christine	Michael	SEA	RB	2	4	2014-01-10 19:11:54.720743	2014-08-02 05:53:44.48949	f
70	Denard	Robinson	JAC	RB	0	11	2014-01-10 19:11:54.724823	2014-08-02 05:53:44.501429	f
71	Knowshon	Moreno	MIA	RB	2	5	2014-01-10 19:11:54.728948	2014-08-02 05:53:44.507157	f
72	Delone	Carter	IND	RB	0	10	2014-01-10 19:11:54.733089	2014-08-02 05:53:44.512808	f
73	Joique	Bell	DET	RB	11	9	2014-01-10 19:11:54.7372	2014-08-02 05:53:44.521508	f
74	Justin	Forsett	JAC	RB	0	11	2014-01-10 19:11:54.74137	2014-08-02 05:53:44.53359	f
75	Mike	James	TB	RB	0	7	2014-01-10 19:11:54.745545	2014-08-02 05:53:44.565089	f
76	Latavius	Murray	OAK	RB	0	5	2014-01-10 19:11:54.749667	2014-08-02 05:53:44.577741	f
77	Evan	Royster	WAS	RB	0	10	2014-01-10 19:11:54.753857	2014-08-02 05:53:44.583332	f
78	LaRod	Stephens-Howling	PIT	RB	0	12	2014-01-10 19:11:54.757993	2014-08-02 05:53:44.593461	f
79	Demaryius	Thomas	DEN	WR	18	4	2014-01-10 19:11:54.762105	2014-08-02 05:53:44.60541	f
80	Jordy	Nelson	GB	WR	16	9	2014-01-10 19:11:54.766235	2014-08-02 05:53:44.610837	f
81	Eric	Decker	NYJ	WR	4	11	2014-01-10 19:11:54.770366	2014-08-02 05:53:44.621424	f
82	Reggie	Wayne	IND	WR	2	10	2014-01-10 19:11:54.774483	2014-08-02 05:53:44.627181	f
83	Steve	Smith	BAL	WR	0	11	2014-01-10 19:11:54.778703	2014-08-02 05:53:44.632823	f
84	Cecil	Shorts	JAC	WR	1	11	2014-01-10 19:11:54.782853	2014-08-02 05:53:44.645546	f
85	Tavon	Austin	STL	WR	1	4	2014-01-10 19:11:54.78697	2014-08-02 05:53:44.667331	f
86	T.Y.	Hilton	IND	WR	4	10	2014-01-10 19:11:54.791075	2014-08-02 05:53:44.677535	f
87	Jeremy	Maclin	PHI	WR	5	7	2014-01-10 19:11:54.814411	2014-08-02 05:53:44.689467	f
89	Danario	Alexander	SD	WR	0	10	2014-01-10 19:11:54.824631	2014-08-02 05:53:44.702696	f
92	Mike	Williams	TB	WR	0	7	2014-01-10 19:11:54.839626	2014-08-02 05:53:44.71844	f
93	Josh	Gordon	CLE	WR	0	4	2014-01-10 19:11:54.844418	2014-08-02 05:53:44.729529	f
94	Anquan	Boldin	SF	WR	1	8	2014-01-10 19:11:54.849523	2014-08-02 05:53:44.881574	f
95	Miles	Austin	DAL	WR	0	11	2014-01-10 19:11:54.854385	2014-08-02 05:53:44.894693	f
96	Denarius	Moore	OAK	WR	0	5	2014-01-10 19:11:54.859228	2014-08-02 05:53:44.903959	f
42	Bryce	Brown	BUF	RB	0	7	2014-01-10 19:11:54.607933	2014-08-06 03:11:47.021239	f
218	New	England Patriots	NE	DEF	1	10	2014-01-10 19:11:55.443613	2014-09-03 02:28:05.08577	f
382	Tim	Wright 	NE	TE	0	\N	2014-09-03 02:34:30.158842	2014-09-03 02:34:30.158842	f
109	Brian	Hartline	MIA	WR	1	6	2014-01-10 19:11:54.923174	2014-01-10 19:11:54.923174	f
166	Dan	Bailey	DAL	K	1	11	2014-01-10 19:11:55.223875	2014-01-10 19:11:55.223875	f
97	Michael	Floyd	ARI	WR	8	4	2014-01-10 19:11:54.864354	2014-08-02 05:53:44.917445	f
98	Ryan	Broyles	DET	WR	0	8	2014-01-10 19:11:54.869163	2014-08-02 05:53:44.923252	f
99	DeAndre	Hopkins	HOU	WR	1	10	2014-01-10 19:11:54.874138	2014-08-02 05:53:44.933458	f
100	Alshon	Jeffery	CHI	WR	14	9	2014-01-10 19:11:54.878889	2014-08-02 05:53:44.939028	f
103	Kendall	Wright	TEN	WR	6	9	2014-01-10 19:11:54.893967	2014-08-02 05:53:44.98262	f
104	Chris	Givens	STL	WR	0	4	2014-01-10 19:11:54.89873	2014-08-02 05:53:44.994775	f
105	Brandon	LaFell	CAR	WR	0	12	2014-01-10 19:11:54.903711	2014-08-02 05:53:45.005575	f
106	Sidney	Rice	SEA	WR	0	4	2014-01-10 19:11:54.90875	2014-08-02 05:53:45.011657	f
108	Santonio	Holmes	NYJ	WR	0	11	2014-01-10 19:11:54.918441	2014-08-02 05:53:45.024819	f
110	Mohamed	Sanu	CIN	WR	0	4	2014-01-10 19:11:54.928311	2014-08-02 05:53:45.03775	f
111	Vincent	Brown	SD	WR	0	10	2014-01-10 19:11:54.93351	2014-08-02 05:53:45.061125	f
112	Rod	Streater	OAK	WR	1	5	2014-01-10 19:11:54.938216	2014-08-02 05:53:45.076287	f
113	Darrius	Heyward-Bey	IND	WR	0	10	2014-01-10 19:11:54.943261	2014-08-02 05:53:45.085426	f
114	Malcom	Floyd	SD	WR	0	10	2014-01-10 19:11:54.947966	2014-08-02 05:53:45.091069	f
115	A.J.	Jenkins	SF	WR	0	8	2014-01-10 19:11:54.953074	2014-08-02 05:53:45.101655	f
116	Joe	Morgan	NO	WR	0	6	2014-01-10 19:11:54.95808	2014-08-02 05:53:45.113619	f
117	Brian	Quick	STL	WR	0	4	2014-01-10 19:11:54.96295	2014-08-02 05:53:45.12005	f
118	Andre	Roberts	ARI	WR	0	4	2014-01-10 19:11:54.96779	2014-08-02 05:53:45.129481	f
119	Santana	Moss	WAS	WR	0	10	2014-01-10 19:11:54.972463	2014-08-02 05:53:45.136258	f
120	Cordarrelle	Patterson	MIN	WR	8	10	2014-01-10 19:11:54.977451	2014-08-02 05:53:45.169315	f
121	Dexter	McCluster	TEN	RB	2	9	2014-01-10 19:11:54.982412	2014-08-02 05:53:45.182466	f
122	Justin	Hunter	TEN	WR	1	9	2014-01-10 19:11:54.987197	2014-08-02 05:53:45.193434	f
123	Golden	Tate	DET	WR	6	9	2014-01-10 19:11:54.992055	2014-08-02 05:53:45.199281	f
124	Robert	Woods	BUF	WR	0	9	2014-01-10 19:11:54.996943	2014-08-02 05:53:45.209448	f
125	Markus	Wheaton	PIT	WR	0	12	2014-01-10 19:11:55.00212	2014-08-02 05:53:45.215174	f
127	Leonard	Hankerson	WAS	WR	0	10	2014-01-10 19:11:55.011619	2014-08-02 05:53:45.231048	f
128	Jeremy	Kerley	NYJ	WR	0	11	2014-01-10 19:11:55.01663	2014-08-02 05:53:45.241428	f
129	Terrance	Williams	DAL	WR	4	11	2014-01-10 19:11:55.021198	2014-08-02 05:53:45.258981	f
130	Keenan	Allen	SD	WR	9	10	2014-01-10 19:11:55.026085	2014-08-02 05:53:45.273443	f
131	Stephen	Hill	NYJ	WR	0	11	2014-01-10 19:11:55.030781	2014-08-02 05:53:45.279351	f
132	Tony	Gonzalez	ATL	TE	0	9	2014-01-10 19:11:55.035605	2014-08-02 05:53:45.284977	f
133	Vernon	Davis	SF	TE	6	8	2014-01-10 19:11:55.040492	2014-08-02 05:53:45.298079	f
134	Dennis	Pitta	BAL	TE	7	11	2014-01-10 19:11:55.045117	2014-08-02 05:53:45.309458	f
135	Jared	Cook	STL	TE	0	4	2014-01-10 19:11:55.050056	2014-08-02 05:53:45.315495	f
137	Antonio	Gates	SD	TE	1	10	2014-01-10 19:11:55.059541	2014-08-02 05:53:45.321429	f
138	Martellus	Bennett	CHI	TE	1	9	2014-01-10 19:11:55.06445	2014-08-02 05:53:45.333958	f
139	Owen	Daniels	HOU	TE	0	10	2014-01-10 19:11:55.069143	2014-08-02 05:53:45.34553	f
140	Jermaine	Gresham	CIN	TE	0	4	2014-01-10 19:11:55.074023	2014-08-02 05:53:45.367895	f
141	Dwayne	Allen	IND	TE	0	10	2014-01-10 19:11:55.078711	2014-08-02 05:53:45.377454	f
142	Dustin	Keller	MIA	TE	0	5	2014-01-10 19:11:55.083528	2014-08-02 05:53:45.383228	f
143	Marcedes	Lewis	JAC	TE	0	11	2014-01-10 19:11:55.08852	2014-08-02 05:53:45.394238	f
144	Fred	Davis	WAS	TE	0	10	2014-01-10 19:11:55.093268	2014-08-02 05:53:45.40001	f
145	Jordan	Cameron	CLE	TE	4	4	2014-01-10 19:11:55.098308	2014-08-02 05:53:45.409445	f
146	Rob	Housler	ARI	TE	0	4	2014-01-10 19:11:55.102991	2014-08-02 05:53:45.415223	f
147	Heath	Miller	PIT	TE	2	12	2014-01-10 19:11:55.107784	2014-08-02 05:53:45.42643	f
148	James	Casey	PHI	TE	0	7	2014-01-10 19:11:55.112249	2014-08-02 05:53:45.432377	f
149	Coby	Fleener	IND	TE	0	10	2014-01-10 19:11:55.117153	2014-08-02 05:53:45.441428	f
151	Zach	Miller	SEA	TE	0	4	2014-01-10 19:11:55.126983	2014-08-02 05:53:45.473686	f
152	Jacob	Tamme	DEN	TE	0	4	2014-01-10 19:11:55.132045	2014-08-02 05:53:45.479395	f
153	Delanie	Walker	TEN	TE	1	9	2014-01-10 19:11:55.137008	2014-08-02 05:53:45.489469	f
154	Travis	Kelce	KC	TE	0	6	2014-01-10 19:11:55.141728	2014-08-02 05:53:45.49582	f
155	Brent	Celek	PHI	TE	0	7	2014-01-10 19:11:55.17636	2014-08-02 05:53:45.503732	f
156	David	Ausberry	OAK	TE	0	5	2014-01-10 19:11:55.180628	2014-08-02 05:53:45.509423	f
157	Stephen	Gostkowski	NE	K	1	10	2014-01-10 19:11:55.184865	2014-08-02 05:53:45.521594	f
158	Matt	Bryant	ATL	K	1	9	2014-01-10 19:11:55.189055	2014-08-02 05:53:45.533439	f
159	Matt	Prater	DEN	K	1	4	2014-01-10 19:11:55.193506	2014-08-02 05:53:45.539131	f
160	Blair	Walsh	MIN	K	0	10	2014-01-10 19:11:55.198313	2014-08-02 05:53:45.559451	f
161	Phil	Dawson	SF	K	1	8	2014-01-10 19:11:55.20268	2014-08-02 05:53:45.573447	f
162	Justin	Tucker	BAL	K	1	11	2014-01-10 19:11:55.20688	2014-08-02 05:53:45.578779	f
163	David	Akers	DET	K	0	8	2014-01-10 19:11:55.211188	2014-08-02 05:53:45.589435	f
164	Sebastian	Janikowski	OAK	K	0	5	2014-01-10 19:11:55.215431	2014-08-02 05:53:45.595406	f
165	Garrett	Hartley	NO	K	0	6	2014-01-10 19:11:55.219645	2014-08-02 05:53:45.601664	f
167	Mason	Crosby	GB	K	1	9	2014-01-10 19:11:55.228019	2014-08-02 05:53:45.621462	f
168	Randy	Bullock	HOU	K	0	10	2014-01-10 19:11:55.232165	2014-08-02 05:53:45.626961	f
169	Greg	Zuerlein	STL	K	0	4	2014-01-10 19:11:55.236304	2014-08-02 05:53:45.637426	f
170	Alex	Henery	PHI	K	0	7	2014-01-10 19:11:55.240433	2014-08-02 05:53:45.642981	f
172	Josh	Brown	NYG	K	0	8	2014-01-10 19:11:55.248893	2014-08-02 05:53:45.664574	f
173	Robbie	Gould	CHI	K	1	9	2014-01-10 19:11:55.253099	2014-08-02 05:53:45.67732	f
174	Kai	Forbath	WAS	K	0	10	2014-01-10 19:11:55.25745	2014-08-02 05:53:45.689495	f
175	Steven	Hauschka	SEA	K	1	4	2014-01-10 19:11:55.261642	2014-08-02 05:53:45.694781	f
176	Lawrence	Tynes	TB	K	0	7	2014-01-10 19:11:55.265832	2014-08-02 05:53:45.704027	f
177	Shayne	Graham	NO	K	1	6	2014-01-10 19:11:55.270023	2014-08-02 05:53:45.709524	f
178	Shaun	Suisham	PIT	K	0	12	2014-01-10 19:11:55.27417	2014-08-02 05:53:45.721407	f
179	Rob	Bironas	TEN	K	0	9	2014-01-10 19:11:55.278287	2014-08-02 05:53:45.733444	f
180	Mike	Nugent	CIN	K	0	4	2014-01-10 19:11:55.282552	2014-08-02 05:53:45.73891	f
181	Nick	Novak	SD	K	1	10	2014-01-10 19:11:55.28683	2014-08-02 05:53:45.765219	f
182	Graham	Gano	CAR	K	0	12	2014-01-10 19:11:55.291253	2014-08-02 05:53:45.781444	f
183	Caleb	Sturgis	MIA	K	0	5	2014-01-10 19:11:55.295385	2014-08-02 05:53:45.78673	f
184	Ryan	Succop	KC	K	0	6	2014-01-10 19:11:55.299596	2014-08-02 05:53:45.797468	f
185	Josh	Scobee	JAC	K	0	11	2014-01-10 19:11:55.303743	2014-08-02 05:53:45.802977	f
186	Jay	Feely	ARI	K	0	4	2014-01-10 19:11:55.307886	2014-08-02 05:53:45.813454	f
187	Dustin	Hopkins	BUF	K	0	9	2014-01-10 19:11:55.312041	2014-08-02 05:53:45.819061	f
188	Nick	Folk	NYJ	K	0	11	2014-01-10 19:11:55.31621	2014-08-02 05:53:45.829444	f
189	Cincinnati	Bengals	CIN	DEF	1	4	2014-01-10 19:11:55.320327	2014-08-02 05:53:45.835143	f
190	Chicago	Bears	CHI	DEF	0	9	2014-01-10 19:11:55.324485	2014-08-02 05:53:45.845445	f
191	Houston	Texans	HOU	DEF	1	10	2014-01-10 19:11:55.328941	2014-08-02 05:53:45.858849	f
296	Antonio	Brown	PIT	WR	0	\N	2014-01-10 19:11:55.82141	2014-08-02 18:49:54.288364	f
279	Brandon	Myers	TB	TE	0	\N	2014-01-10 19:11:55.738431	2014-08-02 20:44:18.276418	f
303	Eddie	Royal	SD	WR	0	\N	2014-01-10 19:11:55.855711	2014-08-06 14:11:00.379947	f
288	John	Carlson	ARI	TE	0	\N	2014-01-10 19:11:55.78214	2014-08-06 14:12:41.474737	f
259	Fozzy	Whittaker	CAR	RB	0	\N	2014-01-10 19:11:55.640767	2014-08-06 14:21:36.54752	f
107	Aaron	Dobson	NE	WR	0	10	2014-01-10 19:11:54.913455	2014-01-11 01:28:56.09914	f
257	Donald	Brown	SD	RB	0	\N	2014-01-10 19:11:55.631092	2014-08-06 14:54:59.263108	f
256	Dennis	Johnson	HOU	RB	0	\N	2014-01-10 19:11:55.626423	2014-08-06 14:55:58.059479	f
248	Chris	Ogbonnaya	CLE	RB	0	\N	2014-01-10 19:11:55.586983	2014-08-06 14:56:26.376055	f
202	Dallas	Cowboys	DAL	DEF	0	11	2014-01-10 19:11:55.377953	2014-01-10 19:11:55.377953	f
247	Bobby	Rainey	TB	RB	0	\N	2014-01-10 19:11:55.582337	2014-08-06 14:59:14.717777	f
246	Benny	Cunningham	STL	RB	0	\N	2014-01-10 19:11:55.558892	2014-08-06 15:00:26.292279	f
240	Terrelle	Pryor	SEA	QB	0	\N	2014-01-10 19:11:55.534184	2014-08-06 15:10:06.541919	f
215	Detroit	Lions	DET	DEF	0	9	2014-01-10 19:11:55.431288	2014-01-10 19:11:55.431288	f
234	Mike	Glennon	TB	QB	0	\N	2014-01-10 19:11:55.509161	2014-08-06 15:11:03.827829	f
230	Mark	Sanchez	PHI	QB	0	\N	2014-01-10 19:11:55.492886	2014-08-06 15:26:20.769868	f
280	Brandon	Pettigrew	DET	TE	0	\N	2014-01-10 19:11:55.743022	2014-08-06 15:29:10.457106	f
286	Jermichael	Finley		TE	0	\N	2014-01-10 19:11:55.772457	2014-08-06 15:30:21.096254	f
231	Matt	McGloin	OAK	QB	0	\N	2014-01-10 19:11:55.496944	2014-08-06 15:31:23.192774	f
261	Jahvid	Best	DET	RB	0	\N	2014-01-10 19:11:55.650414	2014-08-07 13:17:11.371655	t
272	Rashard	Mendenhall	PIT	RB	0	\N	2014-01-10 19:11:55.704336	2014-08-07 13:17:25.433711	t
263	Jason	Snelling	ATL	RB	0	\N	2014-01-10 19:11:55.660068	2014-08-07 13:17:41.427416	t
282	Dallas	Clark	BAL	TE	0	\N	2014-01-10 19:11:55.752791	2014-08-07 13:17:55.440581	t
210	Kansas	City Chiefs	KC	DEF	1	6	2014-01-10 19:11:55.410863	2014-09-02 22:57:05.795345	f
197	Tampa	Bay Buccaneers	TB	DEF	0	7	2014-01-10 19:11:55.356546	2014-09-02 22:57:52.18568	f
196	St.	Louis Rams	STL	DEF	2	4	2014-01-10 19:11:55.352318	2014-09-03 01:34:14.441244	f
377	Andrew	Hawkins	CLE	WR	0	\N	2014-09-03 01:47:33.447362	2014-09-03 01:47:33.447362	f
193	Green Bay	Packers	GB	DEF	0	9	2014-01-10 19:11:55.338492	2014-08-02 05:53:45.881555	f
194	Pittsburgh	Steelers	PIT	DEF	1	12	2014-01-10 19:11:55.343632	2014-08-02 05:53:45.887975	f
195	Atlanta	Falcons	ATL	DEF	0	9	2014-01-10 19:11:55.347909	2014-08-02 05:53:45.894381	f
198	Miami	Dolphins	MIA	DEF	0	5	2014-01-10 19:11:55.360647	2014-08-02 05:53:45.923117	f
199	San Diego	Chargers	SD	DEF	0	10	2014-01-10 19:11:55.364915	2014-08-02 05:53:45.9336	f
200	New York	Giants	NYG	DEF	0	8	2014-01-10 19:11:55.369333	2014-08-02 05:53:45.939912	f
201	Arizona	Cardinals	ARI	DEF	1	4	2014-01-10 19:11:55.373612	2014-08-02 05:53:45.949538	f
203	New York	Jets	NYJ	DEF	0	11	2014-01-10 19:11:55.38209	2014-08-02 05:53:45.96545	f
205	Cleveland	Browns	CLE	DEF	0	4	2014-01-10 19:11:55.390307	2014-08-02 05:53:45.981735	f
206	Tennessee	Titans	TEN	DEF	0	9	2014-01-10 19:11:55.394433	2014-08-02 05:53:45.993573	f
207	Washington	Redskins	WAS	DEF	0	10	2014-01-10 19:11:55.398561	2014-08-02 05:53:45.99985	f
208	Philadelphia	Eagles	PHI	DEF	0	7	2014-01-10 19:11:55.402687	2014-08-02 05:53:46.009485	f
209	Buffalo	Bills	BUF	DEF	0	9	2014-01-10 19:11:55.406756	2014-08-02 05:53:46.015223	f
211	Jacksonville	Jaguars	JAC	DEF	0	11	2014-01-10 19:11:55.415047	2014-08-02 05:53:46.037617	f
212	Minnesota	Vikings	MIN	DEF	0	10	2014-01-10 19:11:55.419116	2014-08-02 05:53:46.043772	f
213	Indianapolis	Colts	IND	DEF	0	10	2014-01-10 19:11:55.423167	2014-08-02 05:53:46.057929	f
214	New Orleans	Saints	NO	DEF	1	6	2014-01-10 19:11:55.42721	2014-08-02 05:53:46.06377	f
216	Oakland	Raiders	OAK	DEF	0	5	2014-01-10 19:11:55.43534	2014-08-02 05:53:46.081643	f
217	Denver	Broncos	DEN	DEF	1	4	2014-01-10 19:11:55.439464	2014-08-02 05:53:46.088096	f
219	San	Francisco 49ers	SF	DEF	0	8	2014-01-10 19:11:55.447716	2014-08-02 05:53:46.118376	f
220	Seattle	Seahawks	SEA	DEF	3	4	2014-01-10 19:11:55.451752	2014-08-02 05:53:46.12961	f
222	Aaron	Rodgers	GB	QB	18	9	2014-01-10 19:11:55.459963	2014-08-02 05:53:46.145455	f
225	Cam	Newton	CAR	QB	4	12	2014-01-10 19:11:55.472276	2014-08-02 05:53:46.184433	f
226	Drew	Brees	NO	QB	17	6	2014-01-10 19:11:55.476339	2014-08-02 05:53:46.193568	f
227	Eli	Manning	NYG	QB	0	8	2014-01-10 19:11:55.480469	2014-08-02 05:53:46.205716	f
229	Kevin	Kolb	\N	QB	0	\N	2014-01-10 19:11:55.488846	2014-08-02 05:53:46.222453	f
232	Matt	Ryan	ATL	QB	14	9	2014-01-10 19:11:55.500937	2014-08-02 05:53:46.24227	f
233	Matthew	Stafford	DET	QB	15	9	2014-01-10 19:11:55.505013	2014-08-02 05:53:46.270037	f
239	Ryan	Fitzpatrick	HOU	QB	0	10	2014-01-10 19:11:55.5301	2014-08-02 05:53:46.308638	f
241	Tom	Brady	NE	QB	9	10	2014-01-10 19:11:55.538329	2014-08-02 05:53:46.330329	f
243	Alfred	Morris	WAS	RB	15	10	2014-01-10 19:11:55.546614	2014-08-02 05:53:46.346256	f
244	Andre	Ellington	ARI	RB	19	4	2014-01-10 19:11:55.550697	2014-08-02 05:53:46.358993	f
249	Chris	Johnson	NYJ	RB	6	11	2014-01-10 19:11:55.592071	2014-08-02 05:53:46.395417	f
250	CJ	Spiller	BUF	RB	12	9	2014-01-10 19:11:55.596803	2014-08-02 05:53:46.401189	f
251	Daniel	Thomas	MIA	RB	0	5	2014-01-10 19:11:55.601854	2014-08-02 05:53:46.413505	f
253	Darren	McFadden	OAK	RB	1	5	2014-01-10 19:11:55.611563	2014-08-02 05:53:46.43043	f
254	David	Wilson	NYG	RB	0	8	2014-01-10 19:11:55.616495	2014-08-02 05:53:46.436257	f
255	DeMarco	Murray	DAL	RB	27	11	2014-01-10 19:11:55.621507	2014-08-02 05:53:46.445428	f
258	Doug	Martin	TB	RB	17	7	2014-01-10 19:11:55.636079	2014-08-02 05:53:46.461576	f
264	Legarrette	Blount	PIT	RB	0	12	2014-01-10 19:11:55.665174	2014-08-02 05:53:46.513417	f
265	LeSean	McCoy	PHI	RB	32	7	2014-01-10 19:11:55.669952	2014-08-02 05:53:46.518897	f
266	Marshawn	Lynch	SEA	RB	16	4	2014-01-10 19:11:55.675181	2014-08-02 05:53:46.529389	f
267	Matt	Forte	CHI	RB	31	9	2014-01-10 19:11:55.68	2014-08-02 05:53:46.541577	f
268	Maurice	Jones-Drew	OAK	RB	4	5	2014-01-10 19:11:55.684855	2014-08-02 05:53:46.547881	f
271	Peyton	Hillis	NYG	RB	0	8	2014-01-10 19:11:55.699569	2014-08-02 05:53:46.570641	f
273	Ray	Rice	BAL	RB	8	11	2014-01-10 19:11:55.709437	2014-08-02 05:53:46.589335	f
276	Stevan	Ridley	NE	RB	5	10	2014-01-10 19:11:55.723798	2014-08-02 05:53:46.618274	f
278	Trent	Richardson	IND	RB	8	10	2014-01-10 19:11:55.733391	2014-08-02 05:53:46.624147	f
281	Charles	Clay	MIA	TE	0	5	2014-01-10 19:11:55.748083	2014-08-02 05:53:46.649341	f
283	Garrett	Graham	HOU	TE	0	10	2014-01-10 19:11:55.757819	2014-08-02 05:53:46.689501	f
284	Greg	Olsen	CAR	TE	5	12	2014-01-10 19:11:55.762819	2014-08-02 05:53:46.695433	f
287	Jimmy	Graham	NO	TE	24	6	2014-01-10 19:11:55.777215	2014-08-02 05:53:46.721435	f
289	Jordan	Reed	WAS	TE	4	10	2014-01-10 19:11:55.786867	2014-08-02 05:53:46.733424	f
291	Kyle	Rudolph	MIN	TE	3	10	2014-01-10 19:11:55.796685	2014-08-02 05:53:46.748534	f
293	Scott	Chandler	BUF	TE	0	9	2014-01-10 19:11:55.806349	2014-08-02 05:53:46.763937	f
294	AJ	Green	CIN	WR	17	4	2014-01-10 19:11:55.811433	2014-08-02 05:53:46.773327	f
295	Andre	Johnson	HOU	WR	11	10	2014-01-10 19:11:55.816158	2014-08-02 05:53:46.779599	f
297	Brandon	Marshall	CHI	WR	17	9	2014-01-10 19:11:55.826146	2014-08-02 05:53:46.801481	f
299	Calvin	Johnson	DET	WR	25	9	2014-01-10 19:11:55.835987	2014-08-02 05:53:46.813289	f
300	Danny	Amendola	NE	WR	1	10	2014-01-10 19:11:55.841163	2014-08-02 05:53:46.825782	f
302	Dwayne	Bowe	KC	WR	2	6	2014-01-10 19:11:55.850948	2014-08-02 05:53:46.84245	f
304	Greg	Little	CLE	WR	0	4	2014-01-10 19:11:55.860805	2014-08-02 05:53:46.865715	f
356	Antonio	Bryant		WR	0	12	2014-08-02 05:53:47.496558	2014-08-04 19:25:29.440477	f
335	Ted	Ginn	ARI	WR	0	\N	2014-01-10 19:11:56.015647	2014-08-06 14:07:40.473086	f
331	Rishard	Matthews	MIA	WR	0	\N	2014-01-10 19:11:55.9953	2014-08-06 14:08:18.133488	f
325	Mohamed	Sanu	CIN	WR	0	\N	2014-01-10 19:11:55.965508	2014-08-06 14:08:55.674584	f
326	Nate	Burleson	CLE	WR	0	\N	2014-01-10 19:11:55.970617	2014-08-06 14:09:19.333769	f
319	Marquise	Goodwin	BUF	WR	0	\N	2014-01-10 19:11:55.935596	2014-08-06 14:10:15.816497	f
310	Jerricho	Cotchery	CAR	WR	0	\N	2014-01-10 19:11:55.890564	2014-08-06 14:10:38.887283	f
314	Kenny	Britt	STL	WR	0	\N	2014-01-10 19:11:55.910435	2014-08-06 15:31:49.049531	f
334	Stevie	Johnson	SF	WR	0	\N	2014-01-10 19:11:56.010539	2014-08-06 15:32:13.205638	f
1	Peyton	Manning	DEN	QB	20	4	2014-01-10 19:11:54.427331	2014-08-02 05:53:43.808464	f
19	Brandon	Weeden	CLE	QB	0	4	2014-01-10 19:11:54.512241	2014-08-02 05:53:44.001098	f
38	Mark	Ingram	NO	RB	0	6	2014-01-10 19:11:54.59144	2014-08-02 05:53:44.205524	f
43	DeAngelo	Williams	CAR	RB	2	12	2014-01-10 19:11:54.612026	2014-08-02 05:53:44.243305	f
67	Montario	Hardesty	CLE	RB	0	4	2014-01-10 19:11:54.712403	2014-08-02 05:53:44.474215	f
88	Steve	Johnson	BUF	WR	0	9	2014-01-10 19:11:54.819697	2014-08-02 05:53:44.695318	f
91	DeSean	Jackson	WAS	WR	5	10	2014-01-10 19:11:54.83458	2014-08-02 05:53:44.713431	f
101	Emmanuel	Sanders	PIT	WR	0	12	2014-01-10 19:11:54.884202	2014-08-02 05:53:44.965825	f
102	Ruben	Randle	NYG	WR	3	8	2014-01-10 19:11:54.888916	2014-08-02 05:53:44.977463	f
126	Nate	Washington	TEN	WR	0	9	2014-01-10 19:11:55.007012	2014-08-02 05:53:45.225432	f
150	Tyler	Eifert	CIN	TE	0	4	2014-01-10 19:11:55.121938	2014-08-02 05:53:45.459118	f
171	Adam	Vinatieri	IND	K	1	10	2014-01-10 19:11:55.244675	2014-08-02 05:53:45.657893	f
192	Baltimore	Ravens	BAL	DEF	0	11	2014-01-10 19:11:55.333342	2014-08-02 05:53:45.869701	f
204	Carolina	Panthers	CAR	DEF	1	12	2014-01-10 19:11:55.386198	2014-08-02 05:53:45.970989	f
223	Andrew	Luck	IND	QB	13	10	2014-01-10 19:11:55.464016	2014-08-02 05:53:46.167303	f
224	Andy	Dalton	CIN	QB	2	4	2014-01-10 19:11:55.468213	2014-08-02 05:53:46.178481	f
228	Josh	McCown	TB	QB	0	7	2014-01-10 19:11:55.484679	2014-08-02 05:53:46.212442	f
237	Nick	Foles	PHI	QB	5	7	2014-01-10 19:11:55.521951	2014-08-02 05:53:46.286207	f
238	Philip	Rivers	SD	QB	2	10	2014-01-10 19:11:55.52604	2014-08-02 05:53:46.297127	f
242	Adrian	Peterson	MIN	RB	29	10	2014-01-10 19:11:55.54245	2014-08-02 05:53:46.336212	f
245	Arian	Foster	HOU	RB	22	10	2014-01-10 19:11:55.554784	2014-08-02 05:53:46.369648	f
252	Darren	Sproles	PHI	RB	4	7	2014-01-10 19:11:55.606831	2014-08-02 05:53:46.419283	f
260	Fred	Jackson	BUF	RB	3	9	2014-01-10 19:11:55.645696	2014-08-02 05:53:46.481475	f
262	Jamaal	Charles	KC	RB	33	6	2014-01-10 19:11:55.655525	2014-08-02 05:53:46.498323	f
270	Mikel	LeShoure	DET	RB	0	8	2014-01-10 19:11:55.694528	2014-08-02 05:53:46.560707	f
274	Reggie	Bush	DET	RB	14	9	2014-01-10 19:11:55.714148	2014-08-02 05:53:46.601457	f
275	Ryan	Mathews	JAC	RB	10	10	2014-01-10 19:11:55.719186	2014-08-02 05:53:46.606777	f
285	Jason	Witten	DAL	TE	8	11	2014-01-10 19:11:55.76759	2014-08-02 05:53:46.7054	f
290	Julius	Thomas	DEN	TE	15	4	2014-01-10 19:11:55.791939	2014-08-02 05:53:46.73888	f
292	Rob	Gronkowski	NE	TE	18	10	2014-01-10 19:11:55.801712	2014-08-02 05:53:46.758828	f
298	Brian	Hartline	MIA	WR	1	5	2014-01-10 19:11:55.83129	2014-08-02 05:53:46.80755	f
301	Dez	Bryant	DAL	WR	17	11	2014-01-10 19:11:55.845893	2014-08-02 05:53:46.837426	f
305	Greg	Jennings	MIN	WR	0	10	2014-01-10 19:11:55.866057	2014-08-02 05:53:46.871425	f
306	Hakeem	Nicks	IND	WR	2	10	2014-01-10 19:11:55.87088	2014-08-02 05:53:46.880778	f
307	Harry	Douglas	ATL	WR	0	9	2014-01-10 19:11:55.87573	2014-08-02 05:53:46.890229	f
308	James	Jones	GB	WR	0	8	2014-01-10 19:11:55.880832	2014-08-02 05:53:46.895029	f
309	Jarrett	Boykin	GB	WR	1	9	2014-01-10 19:11:55.885588	2014-08-02 05:53:46.904624	f
311	Julio	Jones	ATL	WR	17	9	2014-01-10 19:11:55.895568	2014-08-02 05:53:46.917066	f
312	Justin	Blackmon	JAC	WR	0	11	2014-01-10 19:11:55.900441	2014-08-02 05:53:46.926252	f
313	Kenbrell	Thompkins	NE	WR	0	10	2014-01-10 19:11:55.905447	2014-08-02 05:53:46.931915	f
315	Kenny	Stills	NO	WR	1	6	2014-01-10 19:11:55.915355	2014-08-02 05:53:46.967028	f
316	Lance	Moore	NO	WR	0	6	2014-01-10 19:11:55.920328	2014-08-02 05:53:46.982359	f
317	Larry	Fitzgerald	ARI	WR	12	4	2014-01-10 19:11:55.925352	2014-08-02 05:53:47.089562	f
318	Marques	Colston	NO	WR	4	6	2014-01-10 19:11:55.930373	2014-08-02 05:53:47.097881	f
320	Marvin	Jones	CIN	WR	1	4	2014-01-10 19:11:55.940565	2014-08-02 05:53:47.120174	f
321	Michael	Crabtree	SF	WR	11	8	2014-01-10 19:11:55.945588	2014-08-02 05:53:47.126149	f
323	Mike	Williams	SEA	WR	0	4	2014-01-10 19:11:55.955393	2014-08-02 05:53:47.138126	f
327	Percy	Harvin	SEA	WR	6	4	2014-01-10 19:11:55.975519	2014-08-02 05:53:47.181505	f
328	Pierre	Garcon	WAS	WR	12	10	2014-01-10 19:11:55.980429	2014-08-02 05:53:47.187769	f
329	Randall	Cobb	GB	WR	13	9	2014-01-10 19:11:55.985366	2014-08-02 05:53:47.197705	f
330	Riley	Cooper	PHI	WR	1	7	2014-01-10 19:11:55.990336	2014-08-02 05:53:47.209619	f
333	Roddy	White	ATL	WR	7	9	2014-01-10 19:11:56.005449	2014-08-02 05:53:47.233512	f
336	Torrey	Smith	BAL	WR	5	11	2014-01-10 19:11:56.039457	2014-08-02 05:53:47.259062	f
337	Victor	Cruz	NYG	WR	8	8	2014-01-10 19:11:56.044874	2014-08-02 05:53:47.269674	f
338	Vincent	Jackson	TB	WR	10	7	2014-01-10 19:11:56.049635	2014-08-02 05:53:47.281514	f
339	Wes	Welker	DEN	WR	8	4	2014-01-10 19:11:56.054781	2014-08-02 05:53:47.287626	f
340	Teddy	Bridgewater	MIN	QB	0	10	2014-08-02 05:53:47.298643	2014-08-02 05:53:47.298643	f
341	Johnny	Manziel	CLE	QB	0	4	2014-08-02 05:53:47.31116	2014-08-02 05:53:47.31116	f
342	Chad	Henne	JAC	QB	0	11	2014-08-02 05:53:47.321638	2014-08-02 05:53:47.321638	f
343	Bishop	Sankey	TEN	RB	12	9	2014-08-02 05:53:47.334329	2014-08-02 05:53:47.334329	f
344	Devonta	Freeman	ATL	RB	3	9	2014-08-02 05:53:47.345214	2014-08-02 05:53:47.345214	f
345	Terrance	West	CLE	RB	3	4	2014-08-02 05:53:47.362237	2014-08-02 05:53:47.362237	f
346	Khiry	Robinson	NO	RB	2	6	2014-08-02 05:53:47.373415	2014-08-02 05:53:47.373415	f
347	Tre	Mason	STL	RB	2	4	2014-08-02 05:53:47.385806	2014-08-02 05:53:47.385806	f
348	Jeremy	Hill	CIN	RB	1	4	2014-08-02 05:53:47.3976	2014-08-02 05:53:47.3976	f
349	Charles	Sims	TB	RB	1	7	2014-08-02 05:53:47.409902	2014-08-02 05:53:47.409902	f
350	James	White	NE	RB	1	10	2014-08-02 05:53:47.421728	2014-08-02 05:53:47.421728	f
351	Stepfan	Taylor	ARI	RB	1	4	2014-08-02 05:53:47.433229	2014-08-02 05:53:47.433229	f
352	Travaris	Cadet	NO	RB	0	6	2014-08-02 05:53:47.445673	2014-08-02 05:53:47.445673	f
353	Carolos	Hyde	SF	RB	0	8	2014-08-02 05:53:47.467068	2014-08-02 05:53:47.467068	f
354	Lance	Dunbar	DAL	RB	0	11	2014-08-02 05:53:47.478763	2014-08-02 05:53:47.478763	f
355	Andre	Williams	NYG	RB	0	8	2014-08-02 05:53:47.490707	2014-08-02 05:53:47.490707	f
357	Julian	Edelman	NE	WR	7	10	2014-08-02 05:53:47.507177	2014-08-02 05:53:47.507177	f
358	Emmanuel	Asanders	DEN	WR	6	4	2014-08-02 05:53:47.51747	2014-08-02 05:53:47.51747	f
359	Brandin	Cooks	NO	WR	3	6	2014-08-02 05:53:47.529344	2014-08-02 05:53:47.529344	f
360	Sammy	Watkins	BUF	WR	3	9	2014-08-02 05:53:47.541557	2014-08-02 05:53:47.541557	f
361	Mike	Evans	TB	WR	2	7	2014-08-02 05:53:47.561528	2014-08-02 05:53:47.561528	f
362	Jordan	Matthews	PHI	WR	1	7	2014-08-02 05:53:47.574461	2014-08-02 05:53:47.574461	f
363	Doug	Baldwin	SEA	WR	0	4	2014-08-02 05:53:47.586056	2014-08-02 05:53:47.586056	f
364	Kelvin	Benjamin	CAR	WR	0	12	2014-08-02 05:53:47.597412	2014-08-02 05:53:47.597412	f
365	Zach	Ertz	PHI	TE	2	7	2014-08-02 05:53:47.609516	2014-08-02 05:53:47.609516	f
366	Eric	Ebron	DET	TE	1	9	2014-08-02 05:53:47.621668	2014-08-02 05:53:47.621668	f
367	Ladarius	Green	SD	TE	1	10	2014-08-02 05:53:47.633992	2014-08-02 05:53:47.633992	f
368	Jace	Amaro	NYJ	TE	0	11	2014-08-02 05:53:47.645652	2014-08-02 05:53:47.645652	f
369	Mychal	Rivera	OAK	TE	0	5	2014-08-02 05:53:47.665634	2014-08-02 05:53:47.665634	f
370	Austin	Seferian-Jenkins	TB	TE	0	7	2014-08-02 05:53:47.677633	2014-08-02 05:53:47.677633	f
371	Jay	Freely	ARI	K	0	4	2014-08-02 05:53:47.683729	2014-08-02 05:53:47.683729	f
372	Dan	Carpenter	BUF	K	0	9	2014-08-02 05:53:47.693489	2014-08-02 05:53:47.693489	f
373	Connor	Barth	TB	K	0	7	2014-08-02 05:53:47.706194	2014-08-02 05:53:47.706194	f
374	Billy	Cundiff	CLE	K	0	4	2014-08-02 05:53:47.717754	2014-08-02 05:53:47.717754	f
375	Giorgio	Tavecchio	DET	K	0	9	2014-08-02 05:53:47.729562	2014-08-02 05:53:47.729562	f
376	Maikon	Bonani	TEN	K	0	9	2014-08-02 05:53:47.74203	2014-08-02 05:53:47.74203	f
378	Richard	Rodgers 	GB	TE	0	\N	2014-09-03 01:48:19.297191	2014-09-03 01:48:19.297191	f
380	Cody	Latimer 	DEN	WR	0	\N	2014-09-03 02:17:55.035901	2014-09-03 02:17:55.035901	f
381	Odell	Beckham Jr. 	NYG	WR	0	\N	2014-09-03 02:20:18.281991	2014-09-03 02:20:18.281991	f
383	Nate	Freese	DET	KC	0	\N	2014-09-03 02:36:13.504453	2014-09-03 02:36:13.504453	f
384	Andre	Caldwell	DEN	WR	0	\N	2014-09-03 02:37:16.060462	2014-09-03 02:37:16.060462	f
386	Antone	Smith	ATL	RB	0	\N	2014-09-09 19:18:27.997088	2014-09-09 19:18:27.997088	f
\.


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('players_id_seq', 386, true);


--
-- Data for Name: receipts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY receipts (id, receiver_id, receiver_type, notification_id, is_read, trashed, deleted, mailbox_type, created_at, updated_at) FROM stdin;
2	1	User	1	t	f	f	sentbox	2014-05-12 04:25:00.356653	2014-05-12 04:25:00.356653
22	1	User	11	t	f	f	sentbox	2014-06-25 17:55:07.15685	2014-06-25 17:55:07.15685
20	1	User	10	t	f	f	sentbox	2014-05-13 21:38:35.013697	2014-05-13 21:38:35.013697
23	1	User	12	t	f	f	inbox	2014-07-21 17:06:49.717698	2014-07-21 17:06:49.717698
26	1	User	13	t	f	f	sentbox	2014-07-21 17:18:38.034823	2014-07-21 17:18:38.034823
19	7	User	10	t	f	f	inbox	2014-05-13 21:38:35.006383	2014-05-13 21:38:35.006383
24	7	User	12	t	f	f	sentbox	2014-07-21 17:06:49.7275	2014-07-21 17:06:49.7275
25	7	User	13	t	f	f	inbox	2014-07-21 17:18:38.027883	2014-07-21 17:18:38.027883
28	2	User	14	t	f	f	sentbox	2014-08-02 16:47:48.095264	2014-08-02 16:47:48.095264
1	5	User	1	f	t	f	inbox	2014-05-12 04:25:00.348866	2014-05-12 04:25:00.348866
21	5	User	11	f	t	f	inbox	2014-06-25 17:55:07.146665	2014-06-25 17:55:07.146665
32	14	User	16	t	f	f	sentbox	2014-08-02 18:35:11.598711	2014-08-02 18:35:11.598711
18	1	User	9	t	f	f	sentbox	2014-05-12 04:56:08.465958	2014-05-12 04:56:08.465958
29	1	User	15	t	f	f	inbox	2014-08-02 16:51:38.25006	2014-08-02 16:51:38.25006
34	1	User	17	t	f	f	sentbox	2014-08-02 18:43:25.395583	2014-08-02 18:43:25.395583
27	1	User	14	t	f	f	inbox	2014-08-02 16:47:48.079994	2014-08-02 16:47:48.079994
17	2	User	9	t	f	f	inbox	2014-05-12 04:56:08.456769	2014-05-12 04:56:08.456769
30	2	User	15	t	f	f	sentbox	2014-08-02 16:51:38.256088	2014-08-02 16:51:38.256088
33	2	User	17	t	f	f	inbox	2014-08-02 18:43:25.3883	2014-08-02 18:43:25.3883
31	7	User	16	t	f	f	inbox	2014-08-02 18:35:11.594279	2014-08-02 18:35:11.594279
36	5	User	18	t	f	f	sentbox	2014-08-12 21:08:08.324803	2014-08-12 21:08:08.324803
35	6	User	18	t	f	f	inbox	2014-08-12 21:08:08.316312	2014-08-12 21:08:08.316312
38	7	User	19	t	f	f	sentbox	2014-08-13 14:43:01.311571	2014-08-13 14:43:01.311571
37	1	User	19	t	f	f	inbox	2014-08-13 14:43:01.304446	2014-08-13 14:43:01.304446
39	14	User	20	f	f	f	inbox	2014-09-04 21:57:07.005737	2014-09-04 21:57:07.005737
40	3	User	20	t	f	f	sentbox	2014-09-04 21:57:07.015328	2014-09-04 21:57:07.015328
\.


--
-- Name: receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('receipts_id_seq', 40, true);


--
-- Data for Name: roster_spots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roster_spots (id, draft_roster_id, player_id, "position", created_at, updated_at) FROM stdin;
14	6	138	9	2014-08-08 02:23:38.551764	2014-08-08 02:23:38.551764
15	6	330	9	2014-08-08 02:24:17.931457	2014-08-08 02:24:17.931457
16	6	302	10	2014-08-08 02:25:19.672267	2014-08-08 02:25:19.672267
8	6	265	1	2014-08-02 20:45:58.161565	2014-08-02 20:45:58.161565
9	6	241	2	2014-08-02 20:47:53.29441	2014-08-02 20:47:53.29441
22	2	220	1	2014-08-24 15:04:13.764083	2014-08-24 15:04:13.764083
7	2	253	2	2014-07-09 15:00:32.131871	2014-07-09 15:00:32.131871
10	2	175	3	2014-08-06 13:49:42.930293	2014-08-06 13:49:42.930293
23	2	101	4	2014-08-24 15:07:14.575226	2014-08-24 15:07:14.575226
4	2	42	5	2014-04-16 03:55:37.929731	2014-04-16 03:55:37.929731
18	2	340	6	2014-08-17 07:04:44.052833	2014-08-17 07:04:44.052833
20	2	343	7	2014-08-21 13:26:59.244437	2014-08-21 13:26:59.244437
21	2	333	8	2014-08-24 15:00:21.797576	2014-08-24 15:00:21.797576
1	2	330	9	2014-04-08 15:26:33.908076	2014-04-08 15:26:33.908076
3	2	190	10	2014-04-16 03:55:12.778403	2014-04-16 03:55:12.778403
2	2	81	11	2014-04-08 15:26:50.819217	2014-04-08 15:26:50.819217
11	2	217	12	2014-08-06 14:06:23.257807	2014-08-06 14:06:23.257807
12	2	210	13	2014-08-06 14:06:32.036399	2014-08-06 14:06:32.036399
24	2	363	14	2014-08-24 16:05:58.997575	2014-08-24 16:05:58.997575
25	2	307	15	2014-08-24 16:08:51.627039	2014-08-24 16:08:51.627039
26	2	355	16	2014-08-24 16:27:47.280385	2014-08-24 16:27:47.280385
27	7	26	17	2014-09-02 03:18:22.084676	2014-09-02 03:18:22.084676
28	7	278	18	2014-09-02 03:20:02.759842	2014-09-02 03:20:02.759842
29	7	103	19	2014-09-02 03:20:19.02448	2014-09-02 03:20:19.02448
13	6	333	9	2014-08-08 02:22:03.860799	2014-08-08 02:22:03.860799
\.


--
-- Name: roster_spots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roster_spots_id_seq', 29, true);


--
-- Data for Name: salary_progressions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY salary_progressions (id, auction_value, year2, year3, year4, year5, year6, year7, year8, year9, year10, year11, year12, year13, year14, year15, year16, year17, year18, year19, year20, created_at, updated_at) FROM stdin;
1	1	3	5	7	9	12	14	16	18	20	22	24	26	28	30	33	35	37	39	41	2014-01-16 00:15:48.537795	2014-01-16 00:15:48.537795
2	2	4	6	9	11	13	15	17	20	22	24	26	28	31	33	35	37	39	42	44	2014-01-16 00:15:48.548065	2014-01-16 00:15:48.548065
3	3	5	8	10	12	15	17	19	21	24	26	28	31	33	35	38	40	42	44	47	2014-01-16 00:15:48.554051	2014-01-16 00:15:48.554051
4	4	6	9	11	14	16	18	21	23	26	28	30	33	35	38	40	42	45	47	50	2014-01-16 00:15:48.559258	2014-01-16 00:15:48.559258
5	5	8	10	13	15	18	20	23	25	28	30	33	35	38	40	43	45	48	50	53	2014-01-16 00:15:48.564741	2014-01-16 00:15:48.564741
6	6	9	11	14	16	19	22	24	27	29	32	35	37	40	42	45	48	50	53	55	2014-01-16 00:15:48.571462	2014-01-16 00:15:48.571462
7	7	10	12	15	18	21	23	26	29	31	34	37	39	42	45	48	50	53	56	58	2014-01-16 00:15:48.576838	2014-01-16 00:15:48.576838
8	8	11	14	16	19	22	25	28	30	33	36	39	42	44	47	50	53	56	58	61	2014-01-16 00:15:48.582094	2014-01-16 00:15:48.582094
9	9	12	15	18	21	24	26	29	32	35	38	41	44	47	50	53	55	58	61	64	2014-01-16 00:15:48.587484	2014-01-16 00:15:48.587484
10	10	13	16	19	22	25	28	31	34	37	40	43	46	49	52	55	58	61	64	67	2014-01-16 00:15:48.592787	2014-01-16 00:15:48.592787
11	11	14	17	20	23	27	30	33	36	39	42	45	48	51	54	58	61	64	67	70	2014-01-16 00:15:48.598268	2014-01-16 00:15:48.598268
12	12	15	18	22	25	28	31	34	38	41	44	47	50	54	57	60	63	66	70	73	2014-01-16 00:15:48.603484	2014-01-16 00:15:48.603484
13	13	16	20	23	26	30	33	36	39	43	46	49	53	56	59	63	66	69	72	76	2014-01-16 00:15:48.608838	2014-01-16 00:15:48.608838
14	14	17	21	24	28	31	34	38	41	45	48	51	55	58	62	65	68	72	75	79	2014-01-16 00:15:48.614208	2014-01-16 00:15:48.614208
15	15	19	22	26	29	33	36	40	43	47	50	54	57	61	64	68	71	75	78	82	2014-01-16 00:15:48.619809	2014-01-16 00:15:48.619809
16	16	20	23	27	30	34	38	41	45	48	52	56	59	63	66	70	74	77	81	84	2014-01-16 00:15:48.625124	2014-01-16 00:15:48.625124
17	17	21	24	28	32	36	39	43	47	50	54	58	61	65	69	73	76	80	84	87	2014-01-16 00:15:48.630486	2014-01-16 00:15:48.630486
18	18	22	26	29	33	37	41	45	48	52	56	60	64	67	71	75	79	83	86	90	2014-01-16 00:15:48.635814	2014-01-16 00:15:48.635814
19	19	23	27	31	35	39	42	46	50	54	58	62	66	70	74	78	81	85	89	93	2014-01-16 00:15:48.641001	2014-01-16 00:15:48.641001
20	20	24	28	32	36	40	44	48	52	56	60	64	68	72	76	80	84	88	92	96	2014-01-16 00:15:48.646224	2014-01-16 00:15:48.646224
21	21	25	29	33	37	42	46	50	54	58	62	66	70	74	78	83	87	91	95	99	2014-01-16 00:15:48.651679	2014-01-16 00:15:48.651679
22	22	26	30	35	39	43	47	51	56	60	64	68	72	77	81	85	89	93	98	102	2014-01-16 00:15:48.656973	2014-01-16 00:15:48.656973
23	23	27	32	36	40	45	49	53	57	62	66	70	75	79	83	88	92	96	100	105	2014-01-16 00:15:48.662227	2014-01-16 00:15:48.662227
24	24	28	33	37	42	46	50	55	59	64	68	72	77	81	86	90	94	99	103	108	2014-01-16 00:15:48.667479	2014-01-16 00:15:48.667479
25	25	30	34	39	43	48	52	57	61	66	70	75	79	84	88	93	97	102	106	111	2014-01-16 00:15:48.67262	2014-01-16 00:15:48.67262
26	26	31	35	40	44	49	54	58	63	67	72	77	81	86	90	95	100	104	109	113	2014-01-16 00:15:48.677702	2014-01-16 00:15:48.677702
27	27	32	36	41	46	51	55	60	65	69	74	79	83	88	93	98	102	107	112	116	2014-01-16 00:15:48.682951	2014-01-16 00:15:48.682951
28	28	33	38	42	47	52	57	62	66	71	76	81	86	90	95	100	105	110	114	119	2014-01-16 00:15:48.688402	2014-01-16 00:15:48.688402
29	29	34	39	44	49	54	58	63	68	73	78	83	88	93	98	103	107	112	117	122	2014-01-16 00:15:48.693659	2014-01-16 00:15:48.693659
30	30	35	40	45	50	55	60	65	70	75	80	85	90	95	100	105	110	115	120	125	2014-01-16 00:15:48.699222	2014-01-16 00:15:48.699222
31	31	36	41	46	51	57	62	67	72	77	82	87	92	97	102	108	113	118	123	128	2014-01-16 00:15:48.704409	2014-01-16 00:15:48.704409
32	32	37	42	48	53	58	63	68	74	79	84	89	94	100	105	110	115	120	126	131	2014-01-16 00:15:48.709549	2014-01-16 00:15:48.709549
33	33	38	44	49	54	60	65	70	75	81	86	91	97	102	107	113	118	123	128	134	2014-01-16 00:15:48.71478	2014-01-16 00:15:48.71478
34	34	39	45	50	56	61	66	72	77	83	88	93	99	104	110	115	120	126	131	137	2014-01-16 00:15:48.720011	2014-01-16 00:15:48.720011
35	35	41	46	52	57	63	68	74	79	85	90	96	101	107	112	118	123	129	134	140	2014-01-16 00:15:48.725239	2014-01-16 00:15:48.725239
36	36	42	47	53	58	64	70	75	81	86	92	98	103	109	114	120	126	131	137	142	2014-01-16 00:15:48.730479	2014-01-16 00:15:48.730479
37	37	43	48	54	60	66	71	77	83	88	94	100	105	111	117	123	128	134	140	145	2014-01-16 00:15:48.735547	2014-01-16 00:15:48.735547
38	38	44	50	55	61	67	73	79	84	90	96	102	108	113	119	125	131	137	142	148	2014-01-16 00:15:48.740909	2014-01-16 00:15:48.740909
39	39	45	51	57	63	69	74	80	86	92	98	104	110	116	122	128	133	139	145	151	2014-01-16 00:15:48.746349	2014-01-16 00:15:48.746349
40	40	46	52	58	64	70	76	82	88	94	100	106	112	118	124	130	136	142	148	154	2014-01-16 00:15:48.751445	2014-01-16 00:15:48.751445
41	41	47	53	59	65	72	78	84	90	96	102	108	114	120	126	133	139	145	151	157	2014-01-16 00:15:48.756414	2014-01-16 00:15:48.756414
42	42	48	54	61	67	73	79	85	92	98	104	110	116	123	129	135	141	147	154	160	2014-01-16 00:15:48.761611	2014-01-16 00:15:48.761611
43	43	49	56	62	68	75	81	87	93	100	106	112	119	125	131	138	144	150	156	163	2014-01-16 00:15:48.766878	2014-01-16 00:15:48.766878
44	44	50	57	63	70	76	82	89	95	102	108	114	121	127	134	140	146	153	159	166	2014-01-16 00:15:48.772705	2014-01-16 00:15:48.772705
45	45	52	58	65	71	78	84	91	97	104	110	117	123	130	136	143	149	156	162	169	2014-01-16 00:15:48.777901	2014-01-16 00:15:48.777901
46	46	53	59	66	72	79	86	92	99	105	112	119	125	132	138	145	152	158	165	171	2014-01-16 00:15:48.78321	2014-01-16 00:15:48.78321
47	47	54	60	67	74	81	87	94	101	107	114	121	127	134	141	148	154	161	168	174	2014-01-16 00:15:48.788634	2014-01-16 00:15:48.788634
48	48	55	62	68	75	82	89	96	102	109	116	123	130	136	143	150	157	164	170	177	2014-01-16 00:15:48.79413	2014-01-16 00:15:48.79413
49	49	56	63	70	77	84	90	97	104	111	118	125	132	139	146	153	159	166	173	180	2014-01-16 00:15:48.799459	2014-01-16 00:15:48.799459
50	50	57	64	71	78	85	92	99	106	113	120	127	134	141	148	155	162	169	176	183	2014-01-16 00:15:48.804572	2014-01-16 00:15:48.804572
51	51	58	65	72	79	87	94	101	108	115	122	129	136	143	150	158	165	172	179	186	2014-01-16 00:15:48.80989	2014-01-16 00:15:48.80989
52	52	59	66	74	81	88	95	102	110	117	124	131	138	146	153	160	167	174	182	189	2014-01-16 00:15:48.81505	2014-01-16 00:15:48.81505
53	53	60	68	75	82	90	97	104	111	119	126	133	141	148	155	163	170	177	184	192	2014-01-16 00:15:48.82614	2014-01-16 00:15:48.82614
54	54	61	69	76	84	91	98	106	113	121	128	135	143	150	158	165	172	180	187	195	2014-01-16 00:15:48.83309	2014-01-16 00:15:48.83309
55	55	63	70	78	85	93	100	108	115	123	130	138	145	153	160	168	175	183	190	198	2014-01-16 00:15:48.838379	2014-01-16 00:15:48.838379
56	56	64	71	79	86	94	102	109	117	124	132	140	147	155	162	170	178	185	193	200	2014-01-16 00:15:48.843689	2014-01-16 00:15:48.843689
57	57	65	72	80	88	96	103	111	119	126	134	142	149	157	165	173	180	188	196	203	2014-01-16 00:15:48.849159	2014-01-16 00:15:48.849159
58	58	66	74	81	89	97	105	113	120	128	136	144	152	159	167	175	183	191	198	206	2014-01-16 00:15:48.85555	2014-01-16 00:15:48.85555
59	59	67	75	83	91	99	106	114	122	130	138	146	154	162	170	178	185	193	201	209	2014-01-16 00:15:48.860959	2014-01-16 00:15:48.860959
60	60	68	76	84	92	100	108	116	124	132	140	148	156	164	172	180	188	196	204	212	2014-01-16 00:15:48.866329	2014-01-16 00:15:48.866329
61	61	69	77	85	93	102	110	118	126	134	142	150	158	166	174	183	191	199	207	215	2014-01-16 00:15:48.871747	2014-01-16 00:15:48.871747
62	62	70	78	87	95	103	111	119	128	136	144	152	160	169	177	185	193	201	210	218	2014-01-16 00:15:48.876961	2014-01-16 00:15:48.876961
63	63	71	80	88	96	105	113	121	129	138	146	154	163	171	179	188	196	204	212	221	2014-01-16 00:15:48.882209	2014-01-16 00:15:48.882209
64	64	72	81	89	98	106	114	123	131	140	148	156	165	173	182	190	198	207	215	224	2014-01-16 00:15:48.887487	2014-01-16 00:15:48.887487
65	65	74	82	91	99	108	116	125	133	142	150	159	167	176	184	193	201	210	218	227	2014-01-16 00:15:48.893231	2014-01-16 00:15:48.893231
66	66	75	83	92	100	109	118	126	135	143	152	161	169	178	186	195	204	212	221	229	2014-01-16 00:15:48.898468	2014-01-16 00:15:48.898468
67	67	76	84	93	102	111	119	128	137	145	154	163	171	180	189	198	206	215	224	232	2014-01-16 00:15:48.903603	2014-01-16 00:15:48.903603
68	68	77	86	94	103	112	121	130	138	147	156	165	174	182	191	200	209	218	226	235	2014-01-16 00:15:48.908755	2014-01-16 00:15:48.908755
69	69	78	87	96	105	114	122	131	140	149	158	167	176	185	194	203	211	220	229	238	2014-01-16 00:15:48.914087	2014-01-16 00:15:48.914087
70	70	79	88	97	106	115	124	133	142	151	160	169	178	187	196	205	214	223	232	241	2014-01-16 00:15:48.919431	2014-01-16 00:15:48.919431
71	71	80	89	98	107	117	126	135	144	153	162	171	180	189	198	208	217	226	235	244	2014-01-16 00:15:48.92448	2014-01-16 00:15:48.92448
72	72	81	90	100	109	118	127	136	146	155	164	173	182	192	201	210	219	228	238	247	2014-01-16 00:15:48.929682	2014-01-16 00:15:48.929682
73	73	82	92	101	110	120	129	138	147	157	166	175	185	194	203	213	222	231	240	250	2014-01-16 00:15:48.935038	2014-01-16 00:15:48.935038
74	74	83	93	102	112	121	130	140	149	159	168	177	187	196	206	215	224	234	243	253	2014-01-16 00:15:48.940202	2014-01-16 00:15:48.940202
75	75	85	94	104	113	123	132	142	151	161	170	180	189	199	208	218	227	237	246	256	2014-01-16 00:15:48.945497	2014-01-16 00:15:48.945497
76	76	86	95	105	114	124	134	143	153	162	172	182	191	201	210	220	230	239	249	258	2014-01-16 00:15:48.950815	2014-01-16 00:15:48.950815
77	77	87	96	106	116	126	135	145	155	164	174	184	193	203	213	223	232	242	252	261	2014-01-16 00:15:48.985448	2014-01-16 00:15:48.985448
78	78	88	98	107	117	127	137	147	156	166	176	186	196	205	215	225	235	245	254	264	2014-01-16 00:15:48.991049	2014-01-16 00:15:48.991049
79	79	89	99	109	119	129	138	148	158	168	178	188	198	208	218	228	237	247	257	267	2014-01-16 00:15:48.99643	2014-01-16 00:15:48.99643
80	80	90	100	110	120	130	140	150	160	170	180	190	200	210	220	230	240	250	260	270	2014-01-16 00:15:49.00221	2014-01-16 00:15:49.00221
81	81	91	101	111	121	132	142	152	162	172	182	192	202	212	222	233	243	253	263	273	2014-01-16 00:15:49.008271	2014-01-16 00:15:49.008271
82	82	92	102	113	123	133	143	153	164	174	184	194	204	215	225	235	245	255	266	276	2014-01-16 00:15:49.013752	2014-01-16 00:15:49.013752
83	83	93	104	114	124	135	145	155	165	176	186	196	207	217	227	238	248	258	268	279	2014-01-16 00:15:49.019324	2014-01-16 00:15:49.019324
84	84	94	105	115	126	136	146	157	167	178	188	198	209	219	230	240	250	261	271	282	2014-01-16 00:15:49.082002	2014-01-16 00:15:49.082002
85	85	96	106	117	127	138	148	159	169	180	190	201	211	222	232	243	253	264	274	285	2014-01-16 00:15:49.087347	2014-01-16 00:15:49.087347
86	86	97	107	118	128	139	150	160	171	181	192	203	213	224	234	245	256	266	277	287	2014-01-16 00:15:49.092921	2014-01-16 00:15:49.092921
87	87	98	108	119	130	141	151	162	173	183	194	205	215	226	237	248	258	269	280	290	2014-01-16 00:15:49.098424	2014-01-16 00:15:49.098424
88	88	99	110	120	131	142	153	164	174	185	196	207	218	228	239	250	261	272	282	293	2014-01-16 00:15:49.103818	2014-01-16 00:15:49.103818
89	89	100	111	122	133	144	154	165	176	187	198	209	220	231	242	253	263	274	285	296	2014-01-16 00:15:49.10966	2014-01-16 00:15:49.10966
90	90	101	112	123	134	145	156	167	178	189	200	211	222	233	244	255	266	277	288	299	2014-01-16 00:15:49.115138	2014-01-16 00:15:49.115138
91	91	102	113	124	135	147	158	169	180	191	202	213	224	235	246	258	269	280	291	302	2014-01-16 00:15:49.120546	2014-01-16 00:15:49.120546
92	92	103	114	126	137	148	159	170	182	193	204	215	226	238	249	260	271	282	294	305	2014-01-16 00:15:49.126256	2014-01-16 00:15:49.126256
93	93	104	116	127	138	150	161	172	183	195	206	217	229	240	251	263	274	285	296	308	2014-01-16 00:15:49.131755	2014-01-16 00:15:49.131755
94	94	105	117	128	140	151	162	174	185	197	208	219	231	242	254	265	276	288	299	311	2014-01-16 00:15:49.137172	2014-01-16 00:15:49.137172
95	95	107	118	130	141	153	164	176	187	199	210	222	233	245	256	268	279	291	302	314	2014-01-16 00:15:49.142583	2014-01-16 00:15:49.142583
96	96	108	119	131	142	154	166	177	189	200	212	224	235	247	258	270	282	293	305	316	2014-01-16 00:15:49.147855	2014-01-16 00:15:49.147855
97	97	109	120	132	144	156	167	179	191	202	214	226	237	249	261	273	284	296	308	319	2014-01-16 00:15:49.153412	2014-01-16 00:15:49.153412
98	98	110	122	133	145	157	169	181	192	204	216	228	240	251	263	275	287	299	310	322	2014-01-16 00:15:49.158574	2014-01-16 00:15:49.158574
99	99	111	123	135	147	159	170	182	194	206	218	230	242	254	266	278	289	301	313	325	2014-01-16 00:15:49.163873	2014-01-16 00:15:49.163873
100	100	112	124	136	148	160	172	184	196	208	220	232	244	256	268	280	292	304	316	328	2014-01-16 00:15:49.169161	2014-01-16 00:15:49.169161
101	0	3	5	7	9	12	14	16	18	20	22	24	26	28	30	33	35	37	39	41	2014-01-16 00:15:49.174621	2014-01-16 00:15:49.174621
\.


--
-- Name: salary_progressions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salary_progressions_id_seq', 101, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20130207044138
20130207050309
20130207050310
20130207054955
20130216155633
20130216230056
20130311033346
20130319003603
20130320025745
20130425043753
20130523003139
20130914212417
20130914212456
20130916003545
20130916044404
20130918024916
20130921201448
20130921201544
20130921201824
20131004163252
20131006175529
20131011151026
20131013001004
20131225174015
20131225175320
20140104214500
20140107005927
20140107015111
20140107015614
20140112234957
20140112235125
20140113160631
20140121151520
20140131035244
20140210161541
20140212015722
20140217044130
20140218161518
20140218161757
20140218161835
20140313012456
20140404010240
20140423150723
20140429015917
20140429015918
20140429015919
20140429015920
20140429015921
20140429015922
20140515044047
20140527020501
20140527021437
20140527052635
20140606034842
20140606042040
20140610002949
20140616034121
20140625031012
20140709150403
20140709150708
20140709152036
\.


--
-- Data for Name: standings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY standings (id, year, created_at, updated_at) FROM stdin;
1	2011	2014-01-11 06:49:51.123714	2014-01-11 06:49:51.123714
2	2012	2014-01-11 07:01:33.930425	2014-01-11 07:01:33.930425
\.


--
-- Name: standings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('standings_id_seq', 2, true);


--
-- Data for Name: stipulations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY stipulations (id, trade_id, year, stipulation_type, terms, description, rest_of_contract, created_at, updated_at, trade_direction, player_id, trader1_budget_id, trader2_budget_id) FROM stdin;
3	1	2014	Player			t	2014-06-25 17:55:06.951225	2014-06-25 17:55:06.951225	from	1	\N	\N
4	1	2014	Player			t	2014-06-25 17:55:06.952907	2014-06-25 17:55:06.952907	to	222	\N	\N
1	1	2014	Cap space	8		f	2014-06-25 17:55:06.945466	2014-08-02 17:59:30.296358	to	\N	752	252
2	1	2015	Cap space	6		f	2014-06-25 17:55:06.949407	2014-08-02 17:59:30.301962	to	\N	753	253
5	2	2014	Draft spot	1	First round draft pick.	f	2014-08-02 16:47:47.736422	2014-08-02 20:54:01.349022	from	\N	\N	\N
9	2	2013	Player		Remainder of 2013 season only.	f	2014-08-02 20:54:01.352007	2014-08-02 20:54:01.352007	to	91	\N	\N
10	2	2014	Draft spot	16	16th round draft pick	f	2014-08-02 20:54:01.354848	2014-08-02 20:54:01.354848	to	\N	\N	\N
11	2	2014	Other		2014 avatar rights	f	2014-08-02 20:54:01.356457	2014-08-02 20:54:01.356457	from	\N	\N	\N
12	2	2015	Other		2015 avatar rights	f	2014-08-02 20:54:01.358097	2014-08-02 20:54:01.358097	from	\N	\N	\N
13	4	2014	Player		Jim gets Kyle Rudolph + $10.  Todd gets Victor Cruz	t	2014-08-12 21:08:08.1631	2014-08-12 21:08:08.1631	from	291	\N	\N
14	4	2014	Player		Jim gets Kyle Rudolph + $10.  Todd gets Victor Cruz	t	2014-08-12 21:08:08.166112	2014-08-12 21:08:08.166112	to	337	\N	\N
15	4	2014	Cap space	10		f	2014-08-12 21:08:08.167746	2014-08-12 21:38:56.435124	from	\N	252	502
17	5	2014	Draft spot	3 (2)	2, 2014 3rd Round Draft Picks	f	2014-08-13 14:43:01.182111	2014-08-13 14:44:55.950021	from	\N	\N	\N
18	5	2014	Draft spot	4 (2)	2, 2014 4th Round Draft Picks	f	2014-08-13 14:43:01.183754	2014-08-13 14:44:55.952128	to	\N	\N	\N
16	5	2014	Cap space	7		f	2014-08-13 14:43:01.179226	2014-08-13 14:48:23.213333	to	\N	2	752
19	6	2015	Draft spot	5		f	2014-09-04 21:57:06.790302	2014-09-07 15:47:38.97855	from	\N	\N	\N
20	6	2014	Cap space	5		f	2014-09-04 21:57:06.79364	2014-09-07 15:47:38.984926	to	\N	\N	\N
\.


--
-- Name: stipulations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('stipulations_id_seq', 20, true);


--
-- Data for Name: subcontracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY subcontracts (id, team_id, contract_id, salary_amount, contract_year, created_at, updated_at, this_is_an_extension, this_is_a_franchise_tag, this_is_a_buyout) FROM stdin;
1	10	1	35	2011	2014-01-10 20:07:44.877882	2014-01-10 20:07:44.877882	\N	\N	\N
2	10	1	41	2012	2014-01-10 20:07:44.880722	2014-01-10 20:07:44.880722	\N	\N	\N
3	10	1	46	2013	2014-01-10 20:07:44.882357	2014-01-10 20:07:44.882357	\N	\N	\N
4	10	1	52	2014	2014-01-10 20:07:44.883944	2014-01-10 20:07:44.883944	\N	\N	\N
5	10	1	57	2015	2014-01-10 20:07:44.885543	2014-01-10 20:07:44.885543	\N	\N	\N
11	1	3	20	2011	2014-01-10 22:36:44.889406	2014-01-10 22:36:44.889406	\N	\N	\N
12	1	3	24	2012	2014-01-10 22:36:44.890984	2014-01-10 22:36:44.890984	\N	\N	\N
13	1	3	28	2013	2014-01-10 22:36:44.892356	2014-01-10 22:36:44.892356	\N	\N	\N
115	4	30	11	2013	2014-01-10 23:50:43.434577	2014-01-10 23:50:43.434577	\N	\N	\N
48	2	12	3	2012	2014-01-10 22:50:53.855162	2014-01-16 00:18:00.532622	f	f	\N
49	2	12	5	2013	2014-01-10 22:50:53.857191	2014-01-16 00:18:00.534281	f	f	\N
25	10	6	5	2014	2014-01-10 22:41:13.429534	2014-01-10 22:41:13.429534	\N	\N	\N
26	10	6	8	2015	2014-01-10 22:41:13.430859	2014-01-10 22:41:13.430859	\N	\N	\N
27	10	7	0	2013	2014-01-10 22:43:16.004959	2014-01-10 22:43:16.004959	\N	\N	\N
28	10	7	3	2014	2014-01-10 22:43:16.006403	2014-01-10 22:43:16.006403	\N	\N	\N
29	2	8	16	2011	2014-01-10 22:45:30.702616	2014-01-10 22:45:30.702616	\N	\N	\N
30	2	8	20	2012	2014-01-10 22:45:30.704166	2014-01-10 22:45:30.704166	\N	\N	\N
31	2	8	23	2013	2014-01-10 22:45:30.705525	2014-01-10 22:45:30.705525	\N	\N	\N
32	2	8	27	2014	2014-01-10 22:45:30.706837	2014-01-10 22:45:30.706837	\N	\N	\N
33	2	8	30	2015	2014-01-10 22:45:30.708184	2014-01-10 22:45:30.708184	\N	\N	\N
38	2	10	4	2011	2014-01-10 22:48:58.763224	2014-01-10 22:48:58.763224	\N	\N	\N
39	2	10	6	2012	2014-01-10 22:48:58.764709	2014-01-10 22:48:58.764709	\N	\N	\N
40	2	10	9	2013	2014-01-10 22:48:58.766063	2014-01-10 22:48:58.766063	\N	\N	\N
41	2	10	11	2014	2014-01-10 22:48:58.767421	2014-01-10 22:48:58.767421	\N	\N	\N
42	2	10	14	2015	2014-01-10 22:48:58.768828	2014-01-10 22:48:58.768828	\N	\N	\N
43	2	11	1	2011	2014-01-10 22:50:12.663229	2014-01-10 22:50:12.663229	\N	\N	\N
44	2	11	3	2012	2014-01-10 22:50:12.664914	2014-01-10 22:50:12.664914	\N	\N	\N
45	2	11	5	2013	2014-01-10 22:50:12.6663	2014-01-10 22:50:12.6663	\N	\N	\N
46	2	11	7	2014	2014-01-10 22:50:12.6678	2014-01-10 22:50:12.6678	\N	\N	\N
47	2	11	9	2015	2014-01-10 22:50:12.66921	2014-01-10 22:50:12.66921	\N	\N	\N
51	12	13	20	2013	2014-01-10 22:52:20.649697	2014-01-10 22:52:20.649697	\N	\N	\N
57	12	15	0	2013	2014-01-10 22:53:32.472783	2014-01-10 22:53:32.472783	\N	\N	\N
58	12	15	3	2014	2014-01-10 22:53:32.474246	2014-01-10 22:53:32.474246	\N	\N	\N
59	12	15	5	2015	2014-01-10 22:53:32.475626	2014-01-10 22:53:32.475626	\N	\N	\N
60	12	16	1	2011	2014-01-10 22:54:19.090926	2014-01-10 22:54:19.090926	\N	\N	\N
61	12	16	3	2012	2014-01-10 22:54:19.092399	2014-01-10 22:54:19.092399	\N	\N	\N
62	12	16	5	2013	2014-01-10 22:54:19.093808	2014-01-10 22:54:19.093808	\N	\N	\N
65	12	17	6	2013	2014-01-10 22:55:15.991628	2014-01-10 22:55:15.991628	\N	\N	\N
66	12	17	9	2014	2014-01-10 22:55:15.993177	2014-01-10 22:55:15.993177	\N	\N	\N
67	12	17	11	2015	2014-01-10 22:55:15.994486	2014-01-10 22:55:15.994486	\N	\N	\N
68	12	17	14	2016	2014-01-10 22:55:15.99583	2014-01-10 22:55:15.99583	\N	\N	\N
74	11	19	21	2011	2014-01-10 22:58:53.889617	2014-01-10 22:58:53.889617	\N	\N	\N
75	11	19	25	2012	2014-01-10 22:58:53.891293	2014-01-10 22:58:53.891293	\N	\N	\N
76	11	19	29	2013	2014-01-10 22:58:53.892855	2014-01-10 22:58:53.892855	\N	\N	\N
77	11	19	33	2014	2014-01-10 22:58:53.894449	2014-01-10 22:58:53.894449	\N	\N	\N
83	11	22	0	2013	2014-01-10 23:01:40.79014	2014-01-10 23:01:40.79014	\N	\N	\N
84	11	22	3	2014	2014-01-10 23:01:40.791581	2014-01-10 23:01:40.791581	\N	\N	\N
85	9	23	26	2011	2014-01-10 23:03:45.575283	2014-01-10 23:03:45.575283	\N	\N	\N
86	9	23	31	2012	2014-01-10 23:03:45.57701	2014-01-10 23:03:45.57701	\N	\N	\N
87	9	23	35	2013	2014-01-10 23:03:45.578535	2014-01-10 23:03:45.578535	\N	\N	\N
88	9	23	40	2014	2014-01-10 23:03:45.580076	2014-01-10 23:03:45.580076	\N	\N	\N
89	9	24	22	2012	2014-01-10 23:04:47.483637	2014-01-10 23:04:47.483637	\N	\N	\N
90	9	24	26	2013	2014-01-10 23:04:47.485134	2014-01-10 23:04:47.485134	\N	\N	\N
91	9	24	30	2014	2014-01-10 23:04:47.486489	2014-01-10 23:04:47.486489	\N	\N	\N
92	9	25	11	2013	2014-01-10 23:06:39.489435	2014-01-10 23:06:39.489435	\N	\N	\N
93	9	25	14	2014	2014-01-10 23:06:39.491123	2014-01-10 23:06:39.491123	\N	\N	\N
94	9	25	18	2015	2014-01-10 23:06:39.49272	2014-01-10 23:06:58.029632	\N	\N	\N
101	4	27	3	2012	2014-01-10 23:46:58.104858	2014-01-10 23:46:58.104858	\N	\N	\N
102	4	27	5	2013	2014-01-10 23:46:58.106364	2014-01-10 23:46:58.106364	\N	\N	\N
103	4	27	8	2014	2014-01-10 23:46:58.107964	2014-01-10 23:46:58.107964	\N	\N	\N
104	4	27	10	2015	2014-01-10 23:46:58.109365	2014-01-10 23:46:58.109365	\N	\N	\N
105	4	27	12	2016	2014-01-10 23:46:58.11073	2014-01-10 23:46:58.11073	\N	\N	\N
106	4	28	1	2012	2014-01-10 23:48:21.411478	2014-01-10 23:48:21.411478	\N	\N	\N
107	4	28	3	2013	2014-01-10 23:48:21.41314	2014-01-10 23:48:21.41314	\N	\N	\N
110	4	29	4	2013	2014-01-10 23:48:57.43225	2014-01-10 23:48:57.43225	\N	\N	\N
111	4	29	6	2014	2014-01-10 23:48:57.433927	2014-01-10 23:48:57.433927	\N	\N	\N
112	4	29	9	2015	2014-01-10 23:48:57.435473	2014-01-10 23:48:57.435473	\N	\N	\N
113	4	29	11	2016	2014-01-10 23:48:57.437031	2014-01-10 23:48:57.437031	\N	\N	\N
114	4	29	14	2017	2014-01-10 23:48:57.438555	2014-01-10 23:48:57.438555	\N	\N	\N
116	4	30	14	2014	2014-01-10 23:50:43.436067	2014-01-10 23:50:43.436067	\N	\N	\N
117	4	30	17	2015	2014-01-10 23:50:43.437452	2014-01-10 23:50:43.437452	\N	\N	\N
118	4	31	11	2013	2014-01-10 23:51:20.753664	2014-01-10 23:51:20.753664	\N	\N	\N
119	4	31	14	2014	2014-01-10 23:51:20.755118	2014-01-10 23:51:20.755118	\N	\N	\N
120	4	31	17	2015	2014-01-10 23:51:20.756464	2014-01-10 23:51:20.756464	\N	\N	\N
121	4	31	20	2016	2014-01-10 23:51:20.757774	2014-01-10 23:51:20.757774	\N	\N	\N
122	4	32	3	2013	2014-01-10 23:51:56.98297	2014-01-10 23:51:56.98297	\N	\N	\N
123	4	32	5	2014	2014-01-10 23:51:56.984405	2014-01-10 23:51:56.984405	\N	\N	\N
124	4	32	8	2015	2014-01-10 23:51:56.985828	2014-01-10 23:51:56.985828	\N	\N	\N
125	4	32	10	2016	2014-01-10 23:51:56.987405	2014-01-10 23:51:56.987405	\N	\N	\N
126	4	32	12	2017	2014-01-10 23:51:56.988839	2014-01-10 23:51:56.988839	\N	\N	\N
127	4	32	15	2018	2014-01-10 23:51:56.990181	2014-01-10 23:51:56.990181	\N	\N	\N
128	1	33	8	2011	2014-01-11 00:15:21.450081	2014-01-11 00:15:21.450081	\N	\N	\N
129	1	33	11	2012	2014-01-11 00:15:21.451662	2014-01-11 00:15:21.451662	\N	\N	\N
130	1	33	14	2013	2014-01-11 00:15:21.453077	2014-01-11 00:15:21.453077	\N	\N	\N
131	1	33	16	2014	2014-01-11 00:15:21.454488	2014-01-11 00:15:21.454488	\N	\N	\N
132	1	33	19	2015	2014-01-11 00:15:21.455871	2014-01-11 00:15:21.455871	\N	\N	\N
34	2	9	10	2011	2014-01-10 22:47:20.3023	2014-08-01 03:17:03.289236	f	f	f
35	2	9	13	2012	2014-01-10 22:47:20.304232	2014-08-01 03:17:03.291774	f	f	f
36	2	9	16	2013	2014-01-10 22:47:20.30563	2014-08-01 03:17:03.293339	f	f	f
78	11	20	2	2012	2014-01-10 23:00:10.732219	2014-05-25 05:53:07.580046	f	f	f
79	11	20	4	2013	2014-01-10 23:00:10.734822	2014-05-25 05:53:07.582437	f	f	f
80	11	20	6	2014	2014-01-10 23:00:16.494717	2014-05-25 05:53:07.584001	t	f	f
53	12	14	10	2011	2014-01-10 22:53:09.001011	2014-08-01 03:33:54.60754	f	f	f
37	2	9	11	2014	2014-01-10 22:47:20.307108	2014-08-01 03:17:03.299285	f	f	t
54	12	14	13	2012	2014-01-10 22:53:09.002528	2014-08-01 03:33:54.609221	f	f	f
55	12	14	16	2013	2014-01-10 22:53:09.009434	2014-08-01 03:33:54.610729	f	f	f
56	12	14	20	2014	2014-01-10 22:53:09.01103	2014-08-01 03:33:54.612224	f	f	f
81	11	21	4	2013	2014-01-10 23:00:55.890801	2014-08-01 03:36:02.111204	f	f	f
82	11	21	6	2014	2014-01-10 23:00:55.892462	2014-08-01 03:36:02.112812	f	f	f
20	10	5	1	2011	2014-01-10 22:39:46.635726	2014-08-01 15:21:07.508134	f	f	f
21	10	5	3	2012	2014-01-10 22:39:46.638303	2014-08-01 15:21:07.509869	f	f	f
22	10	5	5	2013	2014-01-10 22:39:46.639992	2014-08-01 15:21:07.511352	f	f	f
95	4	26	1	2011	2014-01-10 23:46:01.617688	2014-08-01 15:21:52.964169	f	f	f
23	10	5	4	2014	2014-01-10 22:39:46.641609	2014-08-01 15:21:07.516834	f	f	t
96	4	26	3	2012	2014-01-10 23:46:01.619366	2014-08-01 15:21:52.965917	f	f	f
97	4	26	5	2013	2014-01-10 23:46:01.620952	2014-08-01 15:21:52.967373	f	f	f
98	4	26	7	2014	2014-01-10 23:46:01.622478	2014-08-01 15:21:52.968842	f	f	f
99	4	26	9	2015	2014-01-10 23:46:01.624079	2014-08-01 15:21:52.970357	f	f	f
52	1	13	24	2014	2014-01-10 22:52:20.651177	2014-08-02 17:59:30.408222	\N	\N	\N
14	12	3	32	2014	2014-01-10 22:36:44.893703	2014-08-02 17:59:30.425644	\N	\N	\N
15	12	3	36	2015	2014-01-10 22:36:44.895076	2014-08-02 17:59:30.427328	\N	\N	\N
16	12	3	40	2016	2014-01-10 22:36:44.896397	2014-08-02 17:59:30.428812	\N	\N	\N
24	1	6	3	2013	2014-01-10 22:41:13.428122	2014-08-02 20:55:26.479813	\N	\N	\N
108	12	28	5	2014	2014-01-10 23:48:21.414552	2014-08-12 21:38:56.410619	\N	\N	\N
109	12	28	7	2015	2014-01-10 23:48:21.415956	2014-08-12 21:38:56.413216	\N	\N	\N
63	4	16	7	2014	2014-01-10 22:54:19.095257	2014-08-12 21:38:56.428334	\N	\N	\N
64	4	16	9	2015	2014-01-10 22:54:19.096671	2014-08-12 21:38:56.430003	\N	\N	\N
251	1	71	1	2011	2014-01-11 04:03:54.177244	2014-01-16 00:17:40.34406	f	f	\N
252	1	71	3	2012	2014-01-11 04:03:54.178825	2014-01-16 00:17:40.351701	f	f	\N
137	1	35	9	2012	2014-01-11 00:25:39.826859	2014-01-11 00:25:39.826859	\N	\N	\N
138	1	35	12	2013	2014-01-11 00:25:39.82855	2014-01-11 00:25:39.82855	\N	\N	\N
139	1	35	15	2014	2014-01-11 00:25:39.8301	2014-01-11 00:25:39.8301	\N	\N	\N
140	1	36	9	2013	2014-01-11 00:27:00.86962	2014-01-11 00:27:00.86962	\N	\N	\N
141	1	36	12	2014	2014-01-11 00:27:00.871415	2014-01-11 00:27:00.871415	\N	\N	\N
142	1	36	15	2015	2014-01-11 00:27:00.873105	2014-01-11 00:27:00.873105	\N	\N	\N
143	1	36	18	2016	2014-01-11 00:27:00.874692	2014-01-11 00:27:00.874692	\N	\N	\N
144	1	37	0	2013	2014-01-11 00:27:29.937512	2014-01-11 00:27:29.937512	\N	\N	\N
145	1	37	3	2014	2014-01-11 00:27:29.939196	2014-01-11 00:27:29.939196	\N	\N	\N
146	1	37	5	2015	2014-01-11 00:27:29.940775	2014-01-11 00:27:29.940775	\N	\N	\N
147	1	37	7	2016	2014-01-11 00:27:29.942372	2014-01-11 00:27:29.942372	\N	\N	\N
148	1	37	9	2017	2014-01-11 00:27:29.943949	2014-01-11 00:27:29.943949	\N	\N	\N
149	1	38	2	2013	2014-01-11 00:27:53.72923	2014-01-11 00:27:53.72923	\N	\N	\N
150	1	38	4	2014	2014-01-11 00:27:53.730849	2014-01-11 00:27:53.730849	\N	\N	\N
151	1	38	6	2015	2014-01-11 00:27:53.732415	2014-01-11 00:27:53.732415	\N	\N	\N
152	1	38	9	2016	2014-01-11 00:27:53.733979	2014-01-11 00:27:53.733979	\N	\N	\N
153	1	38	11	2017	2014-01-11 00:27:53.735519	2014-01-11 00:27:53.735519	\N	\N	\N
154	1	39	13	2013	2014-01-11 00:28:20.013191	2014-01-11 00:28:20.013191	\N	\N	\N
155	1	39	16	2014	2014-01-11 00:28:20.014778	2014-01-11 00:28:20.014778	\N	\N	\N
156	1	39	20	2015	2014-01-11 00:28:20.016149	2014-01-11 00:28:20.016149	\N	\N	\N
157	1	40	3	2013	2014-01-11 00:28:51.797264	2014-01-11 00:28:51.797264	\N	\N	\N
158	1	40	5	2014	2014-01-11 00:28:51.798884	2014-01-11 00:28:51.798884	\N	\N	\N
159	1	40	8	2015	2014-01-11 00:28:51.800478	2014-01-11 00:28:51.800478	\N	\N	\N
160	1	40	10	2016	2014-01-11 00:28:51.802057	2014-01-11 00:28:51.802057	\N	\N	\N
161	1	40	12	2017	2014-01-11 00:28:51.803583	2014-01-11 00:28:51.803583	\N	\N	\N
162	1	41	0	2013	2014-01-11 00:29:27.76318	2014-01-11 00:29:27.76318	\N	\N	\N
163	7	41	3	2014	2014-01-11 00:29:27.764969	2014-01-11 00:29:55.568761	\N	\N	\N
164	7	41	5	2015	2014-01-11 00:29:27.7665	2014-01-11 00:29:55.570189	\N	\N	\N
165	7	41	7	2016	2014-01-11 00:29:27.76803	2014-01-11 00:29:55.571542	\N	\N	\N
166	7	41	9	2017	2014-01-11 00:29:27.769574	2014-01-11 00:29:55.572902	\N	\N	\N
167	8	42	13	2013	2014-01-11 00:37:16.061328	2014-01-11 00:37:16.061328	\N	\N	\N
168	8	42	16	2014	2014-01-11 00:37:16.062958	2014-01-11 00:37:16.062958	\N	\N	\N
172	8	44	1	2011	2014-01-11 00:40:28.494278	2014-01-11 00:40:28.494278	\N	\N	\N
173	8	44	3	2012	2014-01-11 00:40:28.495979	2014-01-11 00:40:28.495979	\N	\N	\N
174	8	44	5	2013	2014-01-11 00:40:28.497555	2014-01-11 00:40:28.497555	\N	\N	\N
175	8	44	7	2014	2014-01-11 00:40:28.499098	2014-01-11 00:40:28.499098	\N	\N	\N
176	8	45	3	2013	2014-01-11 00:41:07.011616	2014-01-11 00:41:07.011616	\N	\N	\N
177	8	45	5	2014	2014-01-11 00:41:07.013544	2014-01-11 00:41:07.013544	\N	\N	\N
178	8	46	1	2013	2014-01-11 00:43:43.174526	2014-01-11 00:43:43.174526	\N	\N	\N
179	8	46	3	2014	2014-01-11 00:43:43.176143	2014-01-11 00:43:43.176143	\N	\N	\N
180	8	47	2	2013	2014-01-11 00:44:27.856484	2014-01-11 00:44:27.856484	\N	\N	\N
181	8	47	4	2014	2014-01-11 00:44:27.858141	2014-01-11 00:44:27.858141	\N	\N	\N
182	7	48	15	2012	2014-01-11 00:49:40.929159	2014-01-11 00:49:40.929159	\N	\N	\N
183	7	48	19	2013	2014-01-11 00:49:40.930638	2014-01-11 00:49:40.930638	\N	\N	\N
184	7	48	22	2014	2014-01-11 00:49:40.932008	2014-01-11 00:49:40.932008	\N	\N	\N
185	7	49	4	2013	2014-01-11 00:50:10.911187	2014-01-11 00:50:10.911187	\N	\N	\N
186	7	49	6	2014	2014-01-11 00:50:10.912677	2014-01-11 00:50:10.912677	\N	\N	\N
187	7	49	9	2015	2014-01-11 00:50:10.91407	2014-01-11 00:50:10.91407	\N	\N	\N
188	7	50	16	2013	2014-01-11 01:03:21.163389	2014-01-11 01:03:21.163389	\N	\N	\N
189	7	50	20	2014	2014-01-11 01:03:21.16491	2014-01-11 01:03:21.16491	\N	\N	\N
190	7	50	23	2015	2014-01-11 01:03:21.166254	2014-01-11 01:03:21.166254	\N	\N	\N
191	7	51	13	2013	2014-01-11 01:04:08.848535	2014-01-11 01:04:08.848535	\N	\N	\N
192	7	51	16	2014	2014-01-11 01:04:08.849991	2014-01-11 01:04:08.849991	\N	\N	\N
193	7	51	20	2015	2014-01-11 01:04:08.851401	2014-01-11 01:04:08.851401	\N	\N	\N
197	7	53	0	2013	2014-01-11 01:05:03.783593	2014-01-11 01:05:03.783593	\N	\N	\N
198	7	53	3	2014	2014-01-11 01:05:03.785311	2014-01-11 01:05:03.785311	\N	\N	\N
199	3	54	13	2012	2014-01-11 01:06:22.113466	2014-01-11 01:06:22.113466	\N	\N	\N
200	3	54	16	2013	2014-01-11 01:06:22.115164	2014-01-11 01:06:22.115164	\N	\N	\N
201	7	54	20	2014	2014-01-11 01:06:22.116771	2014-01-11 01:06:30.762158	\N	\N	\N
202	5	55	1	2012	2014-01-11 01:16:17.742827	2014-01-11 01:16:17.742827	\N	\N	\N
203	5	55	3	2013	2014-01-11 01:16:17.74662	2014-01-11 01:16:17.74662	\N	\N	\N
204	5	55	5	2014	2014-01-11 01:16:17.748233	2014-01-11 01:16:17.748233	\N	\N	\N
205	5	55	7	2015	2014-01-11 01:16:17.749783	2014-01-11 01:16:17.749783	\N	\N	\N
206	5	55	9	2016	2014-01-11 01:16:17.751322	2014-01-11 01:16:17.751322	\N	\N	\N
207	5	56	17	2013	2014-01-11 01:16:49.732382	2014-01-11 01:16:49.732382	\N	\N	\N
208	5	56	21	2014	2014-01-11 01:16:49.734147	2014-01-11 01:16:49.734147	\N	\N	\N
209	5	57	4	2013	2014-01-11 01:17:33.423821	2014-01-11 01:17:33.423821	\N	\N	\N
210	5	57	6	2014	2014-01-11 01:17:33.425672	2014-01-11 01:17:33.425672	\N	\N	\N
211	5	57	9	2015	2014-01-11 01:17:33.427397	2014-01-11 01:17:33.427397	\N	\N	\N
212	5	58	3	2013	2014-01-11 01:18:37.53878	2014-01-11 01:18:37.53878	\N	\N	\N
213	5	58	5	2014	2014-01-11 01:18:37.542038	2014-01-11 01:18:37.542038	\N	\N	\N
214	5	59	4	2013	2014-01-11 01:19:53.955465	2014-01-11 01:19:53.955465	\N	\N	\N
215	5	59	6	2014	2014-01-11 01:19:53.9572	2014-01-11 01:19:53.9572	\N	\N	\N
218	6	61	19	2012	2014-01-11 01:21:19.598203	2014-01-11 01:21:19.598203	\N	\N	\N
219	6	61	23	2013	2014-01-11 01:21:19.599889	2014-01-11 01:21:19.599889	\N	\N	\N
220	6	61	27	2014	2014-01-11 01:21:19.601709	2014-01-11 01:21:19.601709	\N	\N	\N
221	6	62	7	2013	2014-01-11 01:22:00.198324	2014-01-11 01:22:00.198324	\N	\N	\N
222	6	62	10	2014	2014-01-11 01:22:00.199981	2014-01-11 01:22:00.199981	\N	\N	\N
223	6	62	12	2015	2014-01-11 01:22:00.20158	2014-01-11 01:22:00.20158	\N	\N	\N
227	6	64	0	2013	2014-01-11 01:23:46.125198	2014-01-11 01:23:46.125198	\N	\N	\N
228	6	64	3	2014	2014-01-11 01:23:46.126666	2014-01-11 01:23:46.126666	\N	\N	\N
229	6	64	5	2015	2014-01-11 01:23:46.12799	2014-01-11 01:23:46.12799	\N	\N	\N
230	6	64	7	2016	2014-01-11 01:23:46.129439	2014-01-11 01:23:46.129439	\N	\N	\N
231	3	65	10	2011	2014-01-11 01:26:04.200744	2014-01-11 01:26:04.200744	\N	\N	\N
232	3	65	13	2012	2014-01-11 01:26:04.202324	2014-01-11 01:26:04.202324	\N	\N	\N
233	3	65	16	2013	2014-01-11 01:26:04.203685	2014-01-11 01:26:04.203685	\N	\N	\N
234	3	65	19	2014	2014-01-11 01:26:04.205035	2014-01-11 01:26:04.205035	\N	\N	\N
235	3	66	11	2013	2014-01-11 01:26:37.454973	2014-01-11 01:26:37.454973	\N	\N	\N
236	3	66	14	2014	2014-01-11 01:26:37.456415	2014-01-11 01:26:37.456415	\N	\N	\N
248	3	70	0	2013	2014-01-11 01:28:56.105271	2014-01-11 01:28:56.105271	\N	\N	\N
249	3	70	3	2014	2014-01-11 01:28:56.106746	2014-01-11 01:28:56.106746	\N	\N	\N
250	3	70	5	2015	2014-01-11 01:28:56.108184	2014-01-11 01:28:56.108184	\N	\N	\N
253	1	71	5	2013	2014-01-11 04:03:54.180428	2014-01-16 00:17:40.353302	f	f	\N
254	1	71	7	2014	2014-01-11 04:03:54.18183	2014-01-16 00:17:40.354879	f	f	\N
255	1	71	9	2015	2014-01-11 04:04:04.755809	2014-01-16 00:17:40.356396	t	f	\N
50	2	12	8	2014	2014-01-10 22:51:03.13075	2014-01-16 00:18:00.535609	t	f	\N
169	8	43	3	2012	2014-01-11 00:37:55.475174	2014-01-16 00:18:35.305243	f	f	\N
170	8	43	5	2013	2014-01-11 00:37:55.476655	2014-01-16 00:18:35.307061	f	f	\N
171	8	43	8	2014	2014-01-11 00:38:04.203781	2014-01-16 00:18:35.308533	t	f	\N
226	6	63	4	2014	2014-01-11 01:23:19.806308	2014-08-01 03:41:11.953088	t	f	t
246	3	69	7	2013	2014-01-11 01:28:26.806357	2014-08-01 03:42:25.712775	f	f	f
247	3	69	10	2014	2014-01-11 01:28:26.80896	2014-08-01 03:42:25.714549	f	f	f
194	7	52	6	2012	2014-01-11 01:04:41.509471	2014-08-01 03:38:57.787102	f	f	f
195	7	52	9	2013	2014-01-11 01:04:41.511159	2014-08-01 03:38:57.788858	f	f	f
196	7	52	11	2014	2014-01-11 01:04:41.512701	2014-08-01 03:38:57.790427	f	f	f
216	5	60	0	2013	2014-01-11 01:20:19.797322	2014-08-01 03:40:24.278015	f	f	f
217	5	60	3	2014	2014-01-11 01:20:19.799282	2014-08-01 03:40:24.279649	f	f	f
224	6	63	2	2012	2014-01-11 01:23:07.641564	2014-08-01 03:41:01.831004	f	f	f
225	6	63	4	2013	2014-01-11 01:23:07.643289	2014-08-01 03:41:01.832638	f	f	f
237	3	67	5	2013	2014-01-11 01:27:17.041648	2014-08-01 15:18:46.470459	f	f	f
238	3	67	5	2014	2014-01-11 01:27:17.043318	2014-08-01 15:20:48.167627	f	f	t
321	10	101	9	2014	2014-09-02 22:43:24.88162	2014-09-02 22:43:24.88162	\N	\N	\N
322	12	102	9	2014	2014-09-02 22:43:48.511563	2014-09-02 22:43:48.511563	\N	\N	\N
323	3	103	12	2014	2014-09-02 22:44:08.266889	2014-09-02 22:44:08.266889	\N	\N	\N
324	11	104	12	2014	2014-09-02 22:44:37.49746	2014-09-02 22:44:37.49746	\N	\N	\N
325	4	105	13	2014	2014-09-02 22:44:58.882903	2014-09-02 22:44:58.882903	\N	\N	\N
326	10	106	7	2014	2014-09-02 22:45:37.270202	2014-09-02 22:45:37.270202	\N	\N	\N
327	6	107	1	2014	2014-09-02 22:45:53.242268	2014-09-02 22:45:53.242268	\N	\N	\N
328	10	108	1	2014	2014-09-02 22:46:25.356181	2014-09-02 22:46:25.356181	\N	\N	\N
329	10	109	1	2014	2014-09-02 22:46:49.427046	2014-09-02 22:46:49.427046	\N	\N	\N
330	10	110	0	2014	2014-09-02 22:47:07.767477	2014-09-02 22:47:07.767477	\N	\N	\N
331	10	111	0	2014	2014-09-02 22:47:28.270076	2014-09-02 22:47:28.270076	\N	\N	\N
332	10	112	0	2014	2014-09-02 22:47:44.622506	2014-09-02 22:47:44.622506	\N	\N	\N
333	10	113	0	2014	2014-09-02 22:48:01.929582	2014-09-02 22:48:01.929582	\N	\N	\N
334	10	114	0	2014	2014-09-02 22:48:18.128419	2014-09-02 22:48:18.128419	\N	\N	\N
335	6	115	1	2014	2014-09-02 22:55:12.097727	2014-09-02 22:55:12.097727	\N	\N	\N
336	6	116	3	2014	2014-09-02 22:56:15.905416	2014-09-02 22:56:15.905416	\N	\N	\N
337	6	117	1	2014	2014-09-02 22:56:40.913019	2014-09-02 22:56:40.913019	\N	\N	\N
266	3	75	2	2012	2014-01-16 00:51:03.911748	2014-01-16 00:51:03.911748	\N	\N	\N
267	3	75	4	2013	2014-01-16 00:51:03.914293	2014-01-16 00:51:03.914293	\N	\N	\N
268	3	75	6	2014	2014-01-16 00:51:03.915828	2014-01-16 00:51:03.915828	\N	\N	\N
269	3	75	9	2015	2014-01-16 00:51:03.917372	2014-01-16 00:51:03.917372	\N	\N	\N
270	3	75	11	2016	2014-01-16 00:51:03.918862	2014-01-16 00:51:03.918862	\N	\N	\N
271	3	75	13	2017	2014-01-16 00:51:03.920489	2014-01-16 00:51:03.920489	\N	\N	\N
272	3	75	15	2018	2014-01-16 00:51:03.922494	2014-01-16 00:51:03.922494	\N	\N	\N
273	3	75	17	2019	2014-01-16 00:51:03.924043	2014-01-16 00:51:03.924043	\N	\N	\N
274	3	75	20	2020	2014-01-16 00:51:03.925619	2014-01-16 00:51:03.925619	\N	\N	\N
275	3	75	22	2021	2014-01-16 00:51:03.927073	2014-01-16 00:51:03.927073	\N	\N	\N
276	3	75	24	2022	2014-01-16 00:51:03.928543	2014-01-16 00:51:03.928543	\N	\N	\N
262	1	74	0	2011	2014-01-16 00:42:39.526642	2014-02-09 03:44:03.594193	f	f	f
263	1	74	3	2012	2014-01-16 00:42:39.528455	2014-02-09 03:44:03.596932	f	f	f
264	1	74	8	2013	2014-01-16 00:42:39.529999	2014-02-09 03:44:03.598624	f	f	t
265	1	74	10	2014	2014-01-16 00:42:39.531481	2014-02-09 03:44:03.599876	f	f	t
277	12	76	2	2013	2014-02-09 03:53:20.99728	2014-02-09 03:53:20.99728	\N	\N	\N
278	12	76	4	2014	2014-02-09 03:53:21.001247	2014-02-09 03:53:21.001247	\N	\N	\N
279	12	76	6	2015	2014-02-09 03:53:21.004424	2014-02-09 03:53:21.004424	\N	\N	\N
280	12	76	9	2016	2014-02-09 03:53:21.007522	2014-02-09 03:53:21.007522	\N	\N	\N
281	12	76	11	2017	2014-02-09 03:53:21.010129	2014-02-09 03:53:21.010129	\N	\N	\N
259	10	73	11	2012	2014-01-16 00:40:07.733488	2014-02-09 17:08:46.99606	f	f	f
260	10	73	11	2013	2014-01-16 00:40:07.735306	2014-02-09 17:08:46.99856	f	f	t
261	10	73	13	2014	2014-01-16 00:40:07.736945	2014-02-09 17:08:47.000063	f	f	t
338	6	118	1	2014	2014-09-02 22:57:05.808431	2014-09-02 22:57:05.808431	\N	\N	\N
283	2	77	6	2013	2014-08-01 03:32:29.612632	2014-08-01 03:32:57.779388	f	f	f
284	2	77	14	2014	2014-08-01 03:32:57.838207	2014-08-01 03:33:05.129098	f	t	f
285	12	14	23	2015	2014-08-01 03:33:54.619257	2014-08-01 03:34:04.213137	t	f	f
286	12	78	14	2013	2014-08-01 03:34:35.062007	2014-08-01 03:34:59.197052	f	f	f
287	12	78	30	2014	2014-08-01 03:34:59.278187	2014-08-01 03:35:07.196705	f	t	f
288	11	21	9	2015	2014-08-01 03:36:02.118964	2014-08-01 03:36:02.118964	t	\N	\N
289	7	52	15	2015	2014-08-01 03:38:57.79701	2014-08-01 03:39:08.696303	t	f	f
290	7	79	14	2013	2014-08-01 03:39:38.669872	2014-08-01 03:39:46.346395	f	f	f
291	7	79	19	2014	2014-08-01 03:39:46.436311	2014-08-01 03:39:54.130409	f	t	f
292	5	60	5	2015	2014-08-01 03:40:24.285766	2014-08-01 03:40:24.285766	t	\N	\N
293	6	80	14	2013	2014-08-01 03:41:35.167587	2014-08-01 03:41:45.240204	f	f	f
294	6	80	19	2014	2014-08-01 03:41:45.32995	2014-08-01 03:41:53.499842	f	t	f
295	3	69	12	2015	2014-08-01 03:42:25.720564	2014-08-01 03:42:25.720564	t	\N	\N
296	3	81	5	2013	2014-08-01 03:43:20.848114	2014-08-01 03:43:26.613624	f	f	f
297	3	81	19	2014	2014-08-01 03:43:26.709704	2014-08-01 03:43:32.845501	f	t	f
100	4	26	11	2016	2014-01-10 23:46:01.625652	2014-08-01 15:21:52.971805	f	f	f
298	11	82	14	2012	2014-08-02 20:33:47.187845	2014-08-02 20:34:08.473258	f	f	f
299	11	82	17	2013	2014-08-02 20:33:47.190836	2014-08-02 20:34:08.475343	f	f	f
300	11	82	30	2014	2014-08-02 20:34:08.583648	2014-08-02 20:34:18.34061	f	t	f
301	5	83	7	2013	2014-08-02 20:43:10.951699	2014-08-02 20:43:22.353222	f	f	f
302	5	83	10	2014	2014-08-02 20:43:10.95363	2014-08-02 20:43:22.354908	f	f	f
303	5	84	1	2013	2014-08-02 20:44:18.289127	2014-08-02 20:44:30.677215	f	f	f
304	5	84	3	2014	2014-08-02 20:44:18.291613	2014-08-02 20:44:30.678892	f	f	f
305	1	85	0	2014	2014-08-28 01:10:34.262216	2014-08-28 01:10:34.262216	\N	\N	\N
306	1	86	1	2014	2014-08-28 01:10:48.545977	2014-08-28 01:10:48.545977	\N	\N	\N
307	1	87	0	2014	2014-08-28 01:11:42.448434	2014-08-28 01:11:42.448434	\N	\N	\N
308	1	88	0	2014	2014-08-28 01:12:01.228044	2014-08-28 01:12:01.228044	\N	\N	\N
309	1	89	1	2014	2014-08-28 01:12:18.92048	2014-08-28 01:12:18.92048	\N	\N	\N
310	1	90	0	2014	2014-08-28 01:12:39.127055	2014-08-28 01:12:39.127055	\N	\N	\N
311	1	91	2	2014	2014-08-28 01:12:55.233818	2014-08-28 01:12:55.233818	\N	\N	\N
312	6	92	23	2014	2014-09-02 03:18:42.732772	2014-09-02 03:18:42.732772	\N	\N	\N
313	6	93	8	2014	2014-09-02 03:21:11.937301	2014-09-02 03:21:11.937301	\N	\N	\N
314	6	94	6	2014	2014-09-02 03:21:39.213549	2014-09-02 03:21:39.213549	\N	\N	\N
315	10	95	32	2014	2014-09-02 22:27:16.964924	2014-09-02 22:27:16.964924	\N	\N	\N
316	8	96	26	2014	2014-09-02 22:28:58.313201	2014-09-02 22:28:58.313201	\N	\N	\N
317	5	97	16	2014	2014-09-02 22:39:22.616484	2014-09-02 22:39:22.616484	\N	\N	\N
318	12	98	14	2014	2014-09-02 22:39:56.053814	2014-09-02 22:39:56.053814	\N	\N	\N
319	9	99	0	2014	2014-09-02 22:42:12.045485	2014-09-02 22:42:12.045485	\N	\N	\N
320	2	100	19	2014	2014-09-02 22:42:53.740059	2014-09-02 22:42:53.740059	\N	\N	\N
339	6	119	0	2014	2014-09-02 22:57:52.196126	2014-09-02 22:57:52.196126	\N	\N	\N
340	6	120	0	2014	2014-09-03 01:07:43.273163	2014-09-03 01:07:43.273163	\N	\N	\N
341	6	121	2	2014	2014-09-03 01:08:03.551064	2014-09-03 01:08:03.551064	\N	\N	\N
342	6	122	1	2014	2014-09-03 01:08:37.845563	2014-09-03 01:08:37.845563	\N	\N	\N
343	8	123	18	2014	2014-09-03 01:10:01.151097	2014-09-03 01:10:01.151097	\N	\N	\N
344	8	124	6	2014	2014-09-03 01:10:17.365319	2014-09-03 01:10:17.365319	\N	\N	\N
345	8	125	6	2014	2014-09-03 01:11:04.147288	2014-09-03 01:11:04.147288	\N	\N	\N
346	8	126	2	2014	2014-09-03 01:11:21.904005	2014-09-03 01:11:21.904005	\N	\N	\N
347	8	127	6	2014	2014-09-03 01:11:37.57219	2014-09-03 01:11:37.57219	\N	\N	\N
348	8	128	2	2014	2014-09-03 01:12:45.13708	2014-09-03 01:12:45.13708	\N	\N	\N
349	8	129	2	2014	2014-09-03 01:13:07.978545	2014-09-03 01:13:07.978545	\N	\N	\N
350	8	130	0	2014	2014-09-03 01:13:49.257167	2014-09-03 01:13:49.257167	\N	\N	\N
351	8	131	1	2014	2014-09-03 01:14:02.813913	2014-09-03 01:14:02.813913	\N	\N	\N
352	8	132	1	2014	2014-09-03 01:14:16.348249	2014-09-03 01:14:16.348249	\N	\N	\N
353	5	133	7	2014	2014-09-03 01:15:09.761795	2014-09-03 01:15:09.761795	\N	\N	\N
354	5	134	5	2014	2014-09-03 01:15:42.882273	2014-09-03 01:15:42.882273	\N	\N	\N
355	5	135	0	2014	2014-09-03 01:15:59.956732	2014-09-03 01:15:59.956732	\N	\N	\N
356	5	136	7	2014	2014-09-03 01:20:49.806603	2014-09-03 01:20:49.806603	\N	\N	\N
357	5	137	1	2014	2014-09-03 01:21:20.167936	2014-09-03 01:21:20.167936	\N	\N	\N
358	5	138	1	2014	2014-09-03 01:27:57.128856	2014-09-03 01:27:57.128856	\N	\N	\N
359	5	139	4	2014	2014-09-03 01:28:16.291787	2014-09-03 01:28:16.291787	\N	\N	\N
360	12	140	3	2014	2014-09-03 01:33:44.735005	2014-09-03 01:33:44.735005	\N	\N	\N
361	12	141	0	2014	2014-09-03 01:33:57.802284	2014-09-03 01:33:57.802284	\N	\N	\N
362	12	142	2	2014	2014-09-03 01:34:14.472271	2014-09-03 01:34:14.472271	\N	\N	\N
363	12	143	4	2014	2014-09-03 01:34:34.627599	2014-09-03 01:34:34.627599	\N	\N	\N
364	12	144	0	2014	2014-09-03 01:35:12.513981	2014-09-03 01:35:12.513981	\N	\N	\N
365	12	145	2	2014	2014-09-03 01:35:25.420128	2014-09-03 01:35:25.420128	\N	\N	\N
366	12	146	1	2014	2014-09-03 01:35:38.975927	2014-09-03 01:35:38.975927	\N	\N	\N
367	9	147	11	2014	2014-09-03 01:42:01.256834	2014-09-03 01:42:01.256834	\N	\N	\N
368	9	148	2	2014	2014-09-03 01:42:15.967992	2014-09-03 01:42:15.967992	\N	\N	\N
369	10	149	0	2014	2014-09-03 01:47:44.581613	2014-09-03 01:47:44.581613	\N	\N	\N
370	10	150	0	2014	2014-09-03 01:48:28.658761	2014-09-03 01:48:28.658761	\N	\N	\N
371	10	151	0	2014	2014-09-03 01:49:57.009126	2014-09-03 01:49:57.009126	\N	\N	\N
372	5	152	0	2014	2014-09-03 01:54:37.846958	2014-09-03 01:54:37.846958	\N	\N	\N
373	8	153	0	2014	2014-09-03 01:55:15.368849	2014-09-03 01:55:15.368849	\N	\N	\N
374	9	154	1	2014	2014-09-03 01:56:04.586409	2014-09-03 01:56:04.586409	\N	\N	\N
375	9	155	4	2014	2014-09-03 01:56:20.312421	2014-09-03 01:56:20.312421	\N	\N	\N
376	9	156	4	2014	2014-09-03 01:56:38.292181	2014-09-03 01:56:38.292181	\N	\N	\N
377	9	157	1	2014	2014-09-03 01:56:49.920563	2014-09-03 01:56:49.920563	\N	\N	\N
378	9	158	0	2014	2014-09-03 01:56:59.422286	2014-09-03 01:56:59.422286	\N	\N	\N
379	9	159	0	2014	2014-09-03 01:57:16.580345	2014-09-03 01:57:16.580345	\N	\N	\N
380	9	160	0	2014	2014-09-03 01:57:27.973994	2014-09-03 01:57:27.973994	\N	\N	\N
381	9	161	1	2014	2014-09-03 01:57:48.177747	2014-09-03 01:57:48.177747	\N	\N	\N
382	9	162	0	2014	2014-09-03 01:58:05.216687	2014-09-03 01:58:05.216687	\N	\N	\N
383	9	163	0	2014	2014-09-03 01:58:17.443016	2014-09-03 01:58:17.443016	\N	\N	\N
384	2	164	10	2014	2014-09-03 01:58:48.90826	2014-09-03 01:58:48.90826	\N	\N	\N
385	2	165	3	2014	2014-09-03 02:00:31.63407	2014-09-03 02:00:31.63407	\N	\N	\N
386	2	166	8	2014	2014-09-03 02:00:44.816451	2014-09-03 02:00:44.816451	\N	\N	\N
387	2	167	4	2014	2014-09-03 02:12:10.471292	2014-09-03 02:12:10.471292	\N	\N	\N
388	2	168	5	2014	2014-09-03 02:12:30.946942	2014-09-03 02:12:30.946942	\N	\N	\N
389	2	169	0	2014	2014-09-03 02:13:05.431938	2014-09-03 02:13:05.431938	\N	\N	\N
390	2	170	1	2014	2014-09-03 02:13:18.125492	2014-09-03 02:13:18.125492	\N	\N	\N
391	2	171	1	2014	2014-09-03 02:15:03.570123	2014-09-03 02:15:03.570123	\N	\N	\N
392	2	172	0	2014	2014-09-03 02:15:58.316754	2014-09-03 02:15:58.316754	\N	\N	\N
393	2	173	0	2014	2014-09-03 02:16:42.636883	2014-09-03 02:16:42.636883	\N	\N	\N
394	2	174	0	2014	2014-09-03 02:18:03.172466	2014-09-03 02:18:03.172466	\N	\N	\N
395	3	175	12	2014	2014-09-03 02:18:36.237461	2014-09-03 02:18:36.237461	\N	\N	\N
396	3	176	2	2014	2014-09-03 02:19:06.811243	2014-09-03 02:19:06.811243	\N	\N	\N
397	3	177	5	2014	2014-09-03 02:19:17.736058	2014-09-03 02:19:17.736058	\N	\N	\N
398	3	178	5	2014	2014-09-03 02:19:28.714603	2014-09-03 02:19:28.714603	\N	\N	\N
399	3	179	0	2014	2014-09-03 02:20:25.067396	2014-09-03 02:20:25.067396	\N	\N	\N
400	3	180	1	2014	2014-09-03 02:22:32.521337	2014-09-03 02:22:32.521337	\N	\N	\N
401	3	181	1	2014	2014-09-03 02:22:47.14174	2014-09-03 02:22:47.14174	\N	\N	\N
402	3	182	1	2014	2014-09-03 02:23:00.48561	2014-09-03 02:23:00.48561	\N	\N	\N
403	11	183	8	2014	2014-09-03 02:24:15.668801	2014-09-03 02:24:15.668801	\N	\N	\N
404	11	184	5	2014	2014-09-03 02:24:29.400053	2014-09-03 02:24:29.400053	\N	\N	\N
405	11	185	6	2014	2014-09-03 02:24:37.751418	2014-09-03 02:24:37.751418	\N	\N	\N
406	11	186	5	2014	2014-09-03 02:25:10.303721	2014-09-03 02:25:10.303721	\N	\N	\N
407	11	187	3	2014	2014-09-03 02:25:26.336538	2014-09-03 02:25:26.336538	\N	\N	\N
408	11	188	0	2014	2014-09-03 02:25:36.954865	2014-09-03 02:25:36.954865	\N	\N	\N
409	11	189	0	2014	2014-09-03 02:25:51.573251	2014-09-03 02:25:51.573251	\N	\N	\N
410	11	190	0	2014	2014-09-03 02:26:00.235931	2014-09-03 02:26:00.235931	\N	\N	\N
411	11	191	0	2014	2014-09-03 02:26:11.315454	2014-09-03 02:26:11.315454	\N	\N	\N
412	11	192	0	2014	2014-09-03 02:26:26.036233	2014-09-03 02:26:26.036233	\N	\N	\N
413	4	193	7	2014	2014-09-03 02:27:06.880943	2014-09-03 02:27:06.880943	\N	\N	\N
414	4	194	8	2014	2014-09-03 02:27:40.33081	2014-09-03 02:27:40.33081	\N	\N	\N
415	4	195	2	2014	2014-09-03 02:27:49.980894	2014-09-03 02:27:49.980894	\N	\N	\N
416	4	196	1	2014	2014-09-03 02:28:05.098037	2014-09-03 02:28:05.098037	\N	\N	\N
417	4	197	2	2014	2014-09-03 02:28:16.540199	2014-09-03 02:28:16.540199	\N	\N	\N
418	4	198	1	2014	2014-09-03 02:29:16.543425	2014-09-03 02:29:16.543425	\N	\N	\N
419	4	199	0	2014	2014-09-03 02:29:27.233683	2014-09-03 02:29:27.233683	\N	\N	\N
420	4	200	0	2014	2014-09-03 02:30:22.41558	2014-09-03 02:30:22.41558	\N	\N	\N
421	7	201	4	2014	2014-09-03 02:31:17.251093	2014-09-03 02:31:17.251093	\N	\N	\N
422	7	202	1	2014	2014-09-03 02:31:32.649388	2014-09-03 02:31:32.649388	\N	\N	\N
423	7	203	1	2014	2014-09-03 02:31:47.670089	2014-09-03 02:31:47.670089	\N	\N	\N
424	7	204	3	2014	2014-09-03 02:31:56.872855	2014-09-03 02:31:56.872855	\N	\N	\N
425	7	205	0	2014	2014-09-03 02:32:06.427518	2014-09-03 02:32:06.427518	\N	\N	\N
426	7	206	1	2014	2014-09-03 02:32:39.102507	2014-09-03 02:32:39.102507	\N	\N	\N
427	7	207	3	2014	2014-09-03 02:33:28.404017	2014-09-03 02:33:28.404017	\N	\N	\N
428	11	208	0	2014	2014-09-03 02:34:41.094427	2014-09-03 02:34:41.094427	\N	\N	\N
429	8	209	4	2014	2014-09-03 02:35:04.348519	2014-09-03 02:35:04.348519	\N	\N	\N
430	4	210	2	2014	2014-09-03 02:35:21.289733	2014-09-03 02:35:21.289733	\N	\N	\N
431	7	211	0	2014	2014-09-03 02:36:22.929741	2014-09-03 02:36:22.929741	\N	\N	\N
432	4	212	0	2014	2014-09-03 02:37:23.383729	2014-09-03 02:37:23.383729	\N	\N	\N
434	1	214	0	2014	2014-09-07 15:59:20.088916	2014-09-07 15:59:20.088916	\N	\N	\N
435	1	215	1	2014	2014-09-09 19:17:06.279992	2014-09-09 19:17:06.279992	\N	\N	\N
436	1	216	0	2014	2014-09-09 19:18:35.700109	2014-09-09 19:18:35.700109	\N	\N	\N
437	1	217	0	2014	2014-09-10 17:41:32.577688	2014-09-10 17:41:32.577688	\N	\N	\N
\.


--
-- Name: subcontracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('subcontracts_id_seq', 437, true);


--
-- Data for Name: super_bowl_picks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY super_bowl_picks (id, team_id, super_bowl_id, nfl_team_id, combined_total, created_at, updated_at) FROM stdin;
1	12	1	23	\N	2014-08-02 18:07:26.401433	2014-08-02 18:07:26.401433
2	7	1	22	\N	2014-08-02 18:21:06.815321	2014-08-02 18:21:06.815321
3	10	1	32	\N	2014-08-02 21:05:33.848454	2014-08-02 21:05:33.848454
4	3	1	13	\N	2014-08-02 23:27:32.986484	2014-08-02 23:27:32.986484
5	6	1	31	\N	2014-08-13 15:19:03.303864	2014-08-13 15:19:03.303864
6	11	1	21	\N	2014-08-13 15:19:03.482585	2014-08-13 15:19:03.482585
7	8	1	13	\N	2014-08-24 07:40:19.359739	2014-08-24 07:40:19.359739
8	1	1	32	\N	2014-08-25 02:54:12.603027	2014-08-25 02:54:12.603027
9	5	1	31	\N	2014-09-03 15:11:26.947135	2014-09-03 15:11:26.947135
10	4	1	13	\N	2014-09-06 05:05:41.398351	2014-09-06 05:05:41.398351
\.


--
-- Name: super_bowl_picks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('super_bowl_picks_id_seq', 10, true);


--
-- Data for Name: super_bowls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY super_bowls (id, nfl_team1_id, nfl_team2_id, tie_breaker, nfl_team1_final_score, nfl_team2_final_score, nfl_winner_id, dopr_winner_id, year, created_at, updated_at) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	2014	2014-08-02 16:17:01.134301	2014-08-02 16:17:01.134301
\.


--
-- Name: super_bowls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('super_bowls_id_seq', 1, true);


--
-- Data for Name: team_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY team_records (id, team_id, standing_id, rank, wlt, pct, division_record, pts_for, pts_against, streak, moves, created_at, updated_at) FROM stdin;
1	8	1	*2	7-6	0.538000000000000034	5-2	1765.92000000000007	1646.23000000000002	W-1	10	2014-01-11 06:49:51.129823	2014-01-11 06:49:51.129823
2	6	1	*4	8-5	0.614999999999999991	6-1	1715.71000000000004	1639.74000000000001	W-2	18	2014-01-11 06:49:51.132468	2014-01-11 06:49:51.132468
3	14	1	7	6-7	0.462000000000000022	4-3	1597.84999999999991	1549.33999999999992	L-1	12	2014-01-11 06:49:51.133934	2014-01-11 06:49:51.133934
4	16	1	9	4-9	0.307999999999999996	0-7	1443.51999999999998	1633.46000000000004	L-3	9	2014-01-11 06:49:51.135342	2014-01-11 06:49:51.135342
5	17	1	10	6-7	0.462000000000000022	4-3	1400.79999999999995	1483.40000000000009	W-1	7	2014-01-11 06:49:51.136697	2014-01-11 06:49:51.136697
6	13	1	11	4-9	0.307999999999999996	2-5	1361.25999999999999	1553.57999999999993	L-1	11	2014-01-11 06:49:51.138066	2014-01-11 06:49:51.138066
7	2	1	*1	10-3	0.769000000000000017	4-3	1811.19000000000005	1547.67000000000007	W-6	28	2014-01-11 06:49:51.139481	2014-01-11 06:49:51.139481
8	15	1	*3	8-5	0.614999999999999991	5-2	1651.53999999999996	1588.53999999999996	W-4	13	2014-01-11 06:49:51.140891	2014-01-11 06:49:51.140891
9	10	1	*5	7-6	0.538000000000000034	4-3	1804.34999999999991	1568.50999999999999	L-1	13	2014-01-11 06:49:51.142267	2014-01-11 06:49:51.142267
10	1	1	*6	9-4	0.691999999999999948	4-3	1747.93000000000006	1607.04999999999995	W-1	14	2014-01-11 06:49:51.143711	2014-01-11 06:49:51.143711
11	11	1	8	5-8	0.385000000000000009	2-5	1518.88000000000011	1678.36999999999989	L-8	22	2014-01-11 06:49:51.145282	2014-01-11 06:49:51.145282
12	3	1	12	4-9	0.307999999999999996	2-5	1418.01999999999998	1741.07999999999993	L-5	11	2014-01-11 06:49:51.146661	2014-01-11 06:49:51.146661
13	12	2	*1	10-3	0.769000000000000017	6-1	1827.43000000000006	1514.23000000000002	W-3	14	2014-01-11 07:01:33.93199	2014-01-11 07:01:33.93199
14	8	2	*5	7-6	0.538000000000000034	4-3	1626.29999999999995	1692.08999999999992	W-1	11	2014-01-11 07:01:33.933747	2014-01-11 07:01:33.933747
15	6	2	*6	7-6	0.538000000000000034	4-3	1558.38000000000011	1525.73000000000002	W-1	8	2014-01-11 07:01:33.935147	2014-01-11 07:01:33.935147
16	16	2	9	5-8	0.385000000000000009	3-4	1450.93000000000006	1606.09999999999991	L-2	16	2014-01-11 07:01:33.936569	2014-01-11 07:01:33.936569
17	4	2	10	4-9	0.307999999999999996	2-5	1526.77999999999997	1675.69000000000005	L-1	30	2014-01-11 07:01:33.937971	2014-01-11 07:01:33.937971
18	17	2	11	4-9	0.307999999999999996	2-5	1326.17000000000007	1577.65000000000009	L-5	4	2014-01-11 07:01:33.939372	2014-01-11 07:01:33.939372
19	2	2	*2	10-3	0.769000000000000017	6-1	1759.26999999999998	1615.34999999999991	W-7	46	2014-01-11 07:01:33.940795	2014-01-11 07:01:33.940795
20	11	2	*3	10-3	0.769000000000000017	5-2	1782.3599999999999	1442.90000000000009	W-2	10	2014-01-11 07:01:33.942195	2014-01-11 07:01:33.942195
21	10	2	*4	7-6	0.538000000000000034	2-5	1657.27999999999997	1615.8599999999999	W-4	10	2014-01-11 07:01:33.943593	2014-01-11 07:01:33.943593
22	3	2	7	6-7	0.462000000000000022	5-2	1671.01999999999998	1680.04999999999995	L-1	11	2014-01-11 07:01:33.945291	2014-01-11 07:01:33.945291
23	15	2	8	5-8	0.385000000000000009	1-6	1568.1099999999999	1630.08999999999992	L-6	8	2014-01-11 07:01:33.946878	2014-01-11 07:01:33.946878
24	1	2	12	3-10	0.231000000000000011	2-5	1526.52999999999997	1704.81999999999994	L-5	12	2014-01-11 07:01:33.948268	2014-01-11 07:01:33.948268
\.


--
-- Name: team_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('team_records_id_seq', 24, true);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY teams (id, team_name, user_id, created_at, updated_at, division) FROM stdin;
13	1st Round Knockout	17	2013-09-24 03:10:57.765366	2014-01-10 19:12:36.736095	Philip
6	War Kittens?!?!?	3	2013-09-24 03:07:41.67294	2014-01-10 19:12:39.549301	Philip
2	Ron Mexico's Revenge	8	2013-09-24 03:06:17.384938	2014-01-10 19:12:42.252474	Russell
8	MooseKnuckles	15	2013-09-24 03:08:45.957313	2014-01-10 19:12:45.567976	Philip
7	Funky Cold Meduna	14	2013-09-24 03:08:21.903378	2014-01-10 19:12:48.651397	Philip
14	Bushrangers	11	2013-09-24 03:11:10.587825	2014-01-10 19:12:59.27525	Philip
4	Pete Caroll-ine	6	2013-09-24 03:07:01.579815	2014-01-10 19:13:02.210847	Philip
15	Darth Sidious	16	2013-09-24 03:11:39.760256	2014-01-10 19:13:05.770969	Russell
1	Tom Selleck Allstars	1	2013-09-24 03:05:57.462654	2014-01-10 19:13:08.729998	Russell
10	Queen City Queefs	2	2013-09-24 03:09:40.355709	2014-01-10 19:13:11.677737	Russell
16	TBD	10	2013-09-24 03:11:54.171201	2014-01-10 19:13:14.307153	Russell
9	Big TD's and no bush	12	2013-09-24 03:09:11.426868	2014-01-10 19:13:20.558135	Russell
3	Nothin' But Luck	4	2013-09-24 03:06:31.651602	2014-01-10 19:13:23.221187	Russell
17	Needledicks	9	2013-09-24 03:12:09.151224	2014-01-10 19:13:26.586624	Philip
5	Price is Right!	13	2013-09-24 03:07:15.700557	2014-01-10 19:13:29.492452	Philip
11	Forte Shades of Jay	7	2013-09-24 03:10:20.682766	2014-07-30 03:15:53.994891	Russell
12	Llama Spit	5	2013-09-24 03:10:42.195283	2014-08-30 02:32:15.513161	Philip
\.


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('teams_id_seq', 18, true);


--
-- Data for Name: trades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trades (id, trader1_id, trader2_id, trader1_accepted, notes, created_at, updated_at, trader2_accepted, is_rejected) FROM stdin;
1	1	12	t		2014-06-25 17:55:06.939754	2014-08-02 17:59:30.430181	t	f
2	10	1	t		2014-08-02 16:47:47.722189	2014-08-02 20:55:26.482166	t	f
4	12	4	t		2014-08-12 21:08:08.159288	2014-08-12 21:38:56.437037	t	f
5	11	1	t		2014-08-13 14:43:01.175735	2014-08-13 14:48:23.214995	t	f
3	7	11	f		2014-08-02 18:35:11.561613	2014-08-13 15:18:36.997362	f	t
6	6	7	t		2014-09-04 21:57:06.786656	2014-09-04 21:57:06.786656	\N	f
\.


--
-- Name: trades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('trades_id_seq', 6, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, encrypted_password, password_salt, created_at, updated_at, remember_me_token, remember_me_token_expires_at, is_admin, display_name, is_current, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, role, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip) FROM stdin;
7	david.gabrel@gmail.com	$2a$10$TsYWPhLhvE9bff1RAzGFEuhqLuGBJNyY3mOOzwm4DOFUhRbn/PNqK	VfosqVfwyjGepTi8bqzW	2013-09-18 14:50:22.342381	2014-08-25 21:53:34.803866	\N	\N	f	Dave Gabrel	t	gabrel.png	image/png	3955	2014-07-30 03:15:11.944637	regular	\N	\N	2014-08-12 16:48:04.39206	10	2014-08-25 21:53:34.801691	2014-08-24 15:31:53.137886	98.227.190.246	98.227.190.246
9	swartz.don@gmail.com	$2a$10$GOy2J3aJP1fXUopyWKBwuuhGC4NO0dnFQR4bHYoDilEhfFKCG5SoW	PbmJNGdXyJrreNKXs7c4	2013-09-18 14:52:39.517247	2014-08-01 15:39:01.491025	\N	\N	f	Donald Swartz	f	\N	\N	\N	\N	regular	\N	\N	\N	0	\N	\N	\N	\N
15	chris.limpach@gmail.com	$2a$10$SRihqXab4yzdcinO06RbOeEeSwjAXcB/ilaMelgNqL1ah1FTqrhFS	ZfZXrEynxysBpsyeRHyg	2013-09-18 14:57:37.305291	2014-08-24 11:26:36.73584	\N	\N	f	Chris Limpach	t	limpach.png	image/png	3882	2014-07-30 03:13:22.693803	regular	\N	\N	2014-08-24 07:38:58.912222	3	2014-08-24 11:26:36.733919	2014-08-24 07:38:58.92046	82.22.114.74	82.22.114.74
12	eresunperro17@yahoo.com	$2a$10$63IZfgGfDK6qotfOro5vGuJ.KY.E0S.s8RRjn.3lzoNrn9FJo1hLS	cqngkRmCzh8sUTYQ7seP	2013-09-18 14:55:59.120164	2014-08-01 15:39:01.735824	\N	\N	f	Hector Garcia	t	hector.jpg	image/jpeg	5911	2014-07-30 03:20:00.47284	regular	\N	\N	\N	0	\N	\N	\N	\N
14	codymeduna@hotmail.com	$2a$10$zK/BKbXBaLlkafUd4XqCe.5uPJ/BwyEP1YjSvPybwqFVQphYAyuDa	JsUysgHyDMDPCJ3d6z34	2013-09-18 14:57:08.049516	2014-08-13 22:53:34.98083	\N	\N	f	Cody Meduna	t	\N	\N	\N	\N	regular	\N	\N	2014-08-02 19:26:23.671689	12	2014-08-13 22:53:34.97949	2014-08-13 16:03:03.272996	70.198.35.28	70.198.35.28
10	jpierce2212@gmail.com	$2a$10$1As0uTalLG/ELL3zYfX6SuO2WbsL20GOQ6AjDPuTdicjBElzI89yW	yQxzKKPVHZyppUxVyboV	2013-09-18 14:54:05.189012	2014-08-01 15:39:01.980305	\N	\N	f	Jordan Pierce	f	\N	\N	\N	\N	regular	\N	\N	\N	0	\N	\N	\N	\N
16	seantepper@gmail.com	$2a$10$pheI98T0y8WIFa6g7ya/He5s5LX3iDz8TU.pD9KYBQApnYASz1goa	peyh7pWXPNcYDebgmToe	2013-09-18 14:58:08.09605	2014-08-01 15:39:02.342803	\N	\N	f	Sean Tepper	f	\N	\N	\N	\N	regular	\N	\N	\N	0	\N	\N	\N	\N
13	davidprice1984@gmail.com	$2a$10$lRafP8zZEbYunSrk9CWVu.hBHmhNluvvy2zM/NarpIm2sXr8Q3mYG	Wp7yvLnEBRZy3fGZhxSh	2013-09-18 14:56:27.951259	2014-09-03 15:09:21.423655	\N	\N	f	David Price	t	price.png	image/png	3882	2014-07-30 03:15:31.440748	regular	\N	\N	\N	1	2014-09-03 15:09:21.421268	2014-09-03 15:09:21.421268	38.125.174.34	38.125.174.34
11	jtkelly13@gmail.com	$2a$10$.3B9AMBHoJtG9hoWT3jkguE0gHTf3XWURpJ4bBmq0y2CQp3pZtRbO	bUV6N3pGY71JU2k2oMxa	2013-09-18 14:55:00.346326	2014-08-01 15:39:02.588295	\N	\N	f	Tyler Kelly	f	\N	\N	\N	\N	regular	\N	\N	\N	0	\N	\N	\N	\N
1	kyle.l.kerley@gmail.com	$2a$10$w.q6hNKnCgWWAVB0eFSWn.jAUaQyvVEB43hwz1mqyegSM87uLYMVS	5YV6iYVssDVpi3fAso2Z	2013-09-18 04:16:57.379143	2014-09-05 13:50:59.818721	KRdzJw5fJUxhMxVdLsHy	2014-03-28 17:09:48.009353	t	Kyle Kerley	t	avatar_bieber.jpg	image/jpeg	54670	2014-08-02 16:14:36.119563	admin	\N	\N	2014-09-02 22:58:07.47055	96	2014-09-05 13:50:59.814746	2014-09-04 22:18:00.170169	174.51.99.164	174.51.99.164
17	rodgers.andre@gmail.com	$2a$10$2fIQdxbTS0DbbIqb1DHKOe6hVds6UKwIGLUpyEVyTBWtYL64q9ofm	hCtpzzngYsTQysuREkKi	2013-09-18 14:59:15.50084	2014-08-01 15:39:00.61422	\N	\N	f	Andre Rodgers	f	\N	\N	\N	\N	regular	\N	\N	\N	0	\N	\N	\N	\N
5	jimdavid6@comcast.net	$2a$10$XK58EDYSGIAoirs6WQalD.o40KbZjnn7exNIU8yRTM7XnXqnbdi3O	MBP6J5m2YzUiqohGQWX4	2013-09-18 14:49:16.948192	2014-09-02 15:31:44.77273	\N	\N	f	Jim David	t	xhUCUya.jpg	image/jpeg	60065	2014-08-30 02:32:14.914679	regular	843c1534f75edae372ad612594cddc95c4cb1653a6dbdcf9a757553604653c3e	2014-05-01 19:27:02.941079	2014-08-25 15:35:05.518226	19	2014-09-02 15:31:44.770395	2014-08-30 02:32:25.640681	75.103.12.76	50.155.135.117
3	atduke7@gmail.com	$2a$10$0Q0EYmPP29pIin17RvHHielYXvCCqMvKRgJtLhYp3E01/hacx6zRy	pQaDyybVoAqnnqwNWwqk	2013-09-18 14:42:35.478512	2014-09-09 14:03:04.022269	\N	\N	t	Andrew Tanker	t	tanker.jpg	image/jpeg	25947	2014-07-30 03:12:51.433192	admin	\N	\N	2014-09-02 03:17:37.784158	13	2014-09-09 14:03:04.015266	2014-09-08 14:52:47.515028	72.48.143.212	72.48.143.212
2	kylelbenton@gmail.com	$2a$10$g.YWLw10R8pW7KBQLkvQIe2MJpMWwkKoumYgpBi4pIkuEPqX6.dKe	ztmMqzXbEycU53HeHZZP	2013-09-18 14:41:57.813118	2014-09-02 17:23:17.358083	\N	\N	f	Kyle Benton	t	benton.png	image/png	14967	2014-07-30 03:16:59.513256	regular	\N	\N	\N	5	2014-09-02 17:23:17.351514	2014-08-24 16:43:34.255431	38.126.164.193	68.168.168.73
4	elijahjwise@gmail.com	$2a$10$SWXLFYnMC8nQheu78s5hFuYIKYDZhayXIZsLC6ddjcaonWX7ndS4m	UA8H2zthegZ26r1smbab	2013-09-18 14:43:22.916656	2014-08-03 12:37:37.778302	\N	\N	f	Elijah Wise	t	\N	\N	\N	\N	regular	\N	\N	\N	4	2014-08-03 12:37:37.77639	2014-08-02 23:25:15.347834	107.9.13.35	107.9.13.35
6	tgraden@yahoo.com	$2a$10$XZD7FtFxeAPGqvvxc53QUOPDUuAI7MM.Xq5rplpvQa6jJ732akRCS	vpPqDVoLziX4xWQ6qko6	2013-09-18 14:49:49.183206	2014-09-12 21:41:36.978145	\N	\N	f	Todd Graden	t	\N	\N	\N	\N	regular	\N	\N	2014-08-03 02:25:04.98992	8	2014-09-12 21:41:36.975473	2014-09-06 05:04:54.359624	50.183.29.248	70.196.204.61
8	kevin.cornell@marquette.edu	$2a$10$omGHWPc4xuaoLUm9w3eqeOrV1OUu8Vdd.VTU4KnXdgY370MZ.klre	mPpv32iV215phDeVjvcx	2013-09-18 14:51:07.912964	2014-08-04 15:31:32.642792	\N	\N	f	Chris Cornell	t	cornell.png	image/png	27125	2014-07-30 03:13:07.127182	regular	\N	\N	\N	4	2014-08-04 15:31:32.640439	2014-08-02 16:47:18.786819	134.48.22.190	72.135.193.236
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 17, true);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (id);


--
-- Name: budgets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY budgets
    ADD CONSTRAINT budgets_pkey PRIMARY KEY (id);


--
-- Name: contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: draft_rosters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY draft_rosters
    ADD CONSTRAINT draft_rosters_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: nfl_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nfl_teams
    ADD CONSTRAINT nfl_teams_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: payouts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY payouts
    ADD CONSTRAINT payouts_pkey PRIMARY KEY (id);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY receipts
    ADD CONSTRAINT receipts_pkey PRIMARY KEY (id);


--
-- Name: roster_spots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roster_spots
    ADD CONSTRAINT roster_spots_pkey PRIMARY KEY (id);


--
-- Name: salary_progressions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salary_progressions
    ADD CONSTRAINT salary_progressions_pkey PRIMARY KEY (id);


--
-- Name: standings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY standings
    ADD CONSTRAINT standings_pkey PRIMARY KEY (id);


--
-- Name: stipulations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stipulations
    ADD CONSTRAINT stipulations_pkey PRIMARY KEY (id);


--
-- Name: subcontracts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subcontracts
    ADD CONSTRAINT subcontracts_pkey PRIMARY KEY (id);


--
-- Name: super_bowl_picks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY super_bowl_picks
    ADD CONSTRAINT super_bowl_picks_pkey PRIMARY KEY (id);


--
-- Name: super_bowls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY super_bowls
    ADD CONSTRAINT super_bowls_pkey PRIMARY KEY (id);


--
-- Name: team_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY team_records
    ADD CONSTRAINT team_records_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: trades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_activities_on_owner_id_and_owner_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_activities_on_owner_id_and_owner_type ON activities USING btree (owner_id, owner_type);


--
-- Name: index_activities_on_recipient_id_and_recipient_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_activities_on_recipient_id_and_recipient_type ON activities USING btree (recipient_id, recipient_type);


--
-- Name: index_activities_on_trackable_id_and_trackable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_activities_on_trackable_id_and_trackable_type ON activities USING btree (trackable_id, trackable_type);


--
-- Name: index_notifications_on_conversation_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_notifications_on_conversation_id ON notifications USING btree (conversation_id);


--
-- Name: index_players_on_auction_value; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_players_on_auction_value ON players USING btree (auction_value);


--
-- Name: index_players_on_first_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_players_on_first_name ON players USING btree (first_name);


--
-- Name: index_players_on_last_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_players_on_last_name ON players USING btree (last_name);


--
-- Name: index_players_on_nfl_team; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_players_on_nfl_team ON players USING btree (nfl_team);


--
-- Name: index_players_on_position; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_players_on_position ON players USING btree ("position");


--
-- Name: index_receipts_on_notification_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_receipts_on_notification_id ON receipts USING btree (notification_id);


--
-- Name: index_stipulations_on_trader1_budget_id_and_trader2_budget_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_stipulations_on_trader1_budget_id_and_trader2_budget_id ON stipulations USING btree (trader1_budget_id, trader2_budget_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_me_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_remember_me_token ON users USING btree (remember_me_token);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: notifications_on_conversation_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_on_conversation_id FOREIGN KEY (conversation_id) REFERENCES conversations(id);


--
-- Name: receipts_on_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY receipts
    ADD CONSTRAINT receipts_on_notification_id FOREIGN KEY (notification_id) REFERENCES notifications(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

